//
//  ApiRequestLoader.swift
//  APIRequestLoader
//
//  Created by Yogesh Raj on 04/07/23.
//


import Foundation

// Singleton Design Pattern
enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
    case decoding(Error?)
    case noInternet
}

extension DataError: CustomStringConvertible {
    public var description: String {
        switch self {
            
        case .invalidResponse:
            return "invalidResponse"
        case .invalidURL:
            return "invalidURL"
        case .invalidData:
            return "invalidData"
        case .network(let error):
            return error!.localizedDescription
        case .decoding(let error):
            return error!.localizedDescription
        case .noInternet:
            return "noInternet"
        }
    }
}

typealias ResultHandler<T> = (Result<T, DataError>) -> Void

final class ApiRequestLoader {
    
    static let shared = ApiRequestLoader()
    private let networkHandler: NetworkHandler
    private let responseHandler: ResponseHandler
    
    init(networkHandler: NetworkHandler = NetworkHandler(),
         responseHandler: ResponseHandler = ResponseHandler()) {
        self.networkHandler = networkHandler
        self.responseHandler = responseHandler
    }
    
    func request<T: Codable>(
        modelType: T.Type,
        type: EndPointType,
        completion: @escaping ResultHandler<T>
    ) {
        
        if !Reachability.isConnectedToNetwork() {
            completion(.failure(.noInternet))
            return
        }
        guard let url = type.url else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = type.method.rawValue
        
        if let parameters = type.body {
            request.httpBody = try? JSONEncoder().encode(parameters)
        }
        
        request.allHTTPHeaderFields = type.headers
        request.addValue("ResyAPI api_key=\"VbWk7s3L4KiK5fzlO7JD3Q5EYolJI7n5\"", forHTTPHeaderField: "Authorization")
        
        // Network Request - URL TO DATA
        networkHandler.requestDataAPI(url: request) { result in
            switch result {
            case .success(let data):
                // Json parsing - Decoder - DATA TO MODEL
                self.responseHandler.parseResonseDecode(
                    data: data,
                    modelType: modelType) { response in
                        switch response {
                        case .success(let mainResponse):
                            completion(.success(mainResponse)) // Final
                        case .failure(let error):
                            completion(.failure(error))
                        }
                    }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    static var commonHeaders: [String: String] {
        return [
            "Content-Type": "application/json",
            "Authorization": "ResyAPI api_key=VbWk7s3L4KiK5fzlO7JD3Q5EYolJI7n5"
        ]
    }
    
}

class NetworkHandler {
    
    func requestDataAPI(
        url: URLRequest,
        completionHandler: @escaping (Result<Data, DataError>) -> Void
    ) {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 30.0
        sessionConfig.timeoutIntervalForResource = 30.0
        let session = URLSession(configuration: sessionConfig, delegate: self as? URLSessionDelegate, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completionHandler(.failure(.invalidResponse))
                return
            }
            
            guard let data, error == nil else {
                completionHandler(.failure(.invalidData))
                return
            }
            completionHandler(.success(data))
        }
        task.resume()
    }
}

class ResponseHandler {
    
    func parseResonseDecode<T: Decodable>(
        data: Data,
        modelType: T.Type,
        completionHandler: ResultHandler<T>
    ) {
        do {
            let response = try JSONDecoder().decode(modelType, from: data)
            completionHandler(.success(response))
        }catch {
            completionHandler(.failure(.decoding(error)))
        }
    }
}
