//
//  Error.swift
//  APIRequestLoader
//
//  Created by Yogesh Raj on 05/07/23.
//


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
            return "your device is not connected to internet"
        }
    }
}
