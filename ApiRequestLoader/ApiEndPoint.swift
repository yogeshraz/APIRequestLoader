//
//  ApiEndPoint.swift
//  APIRequestLoader
//
//  Created by Yogesh Raj on 04/07/23.
//

import Foundation

enum ApiEndPoint {
    case event(Id: String) // Module - GET
    //case addProduct(product: AddProduct) // POST
}

// https://fakestoreapi.com/products
extension ApiEndPoint: EndPointType {

    var path: String {
        switch self {
        case .event(let Id):
            return "venue_id=\(Id)"
        }
    }

    var baseURL: String {
        switch self {
        case .event:
            return "https://api.resy.com/3/events/upcoming?"
        }
    }

    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }

    var method: HTTPMethods {
        switch self {
        case .event:
            return .get
        }
    }

    var body: Encodable? {
        switch self {
        case .event:
            return nil
        }
    }

    var headers: [String : String]? {
        ApiRequestLoader.commonHeaders
    }
}
