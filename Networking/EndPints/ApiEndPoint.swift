//
//  ApiEndPoint.swift
//  APIRequestLoader
//
//  Created by Yogesh Raj on 04/07/23.
//

import Foundation

enum ApiEndPoint {
    case event(Id: String) // Module - GET
    case addProduct(product: AddProduct) // POST
}

// https://fakestoreapi.com/products
extension ApiEndPoint: EndPointType {

    var path: String {
        switch self {
        case .event(let Id):
            return "venue_id=\(Id)"
        case .addProduct(product: _):
            return "add"
        }
    }

    var baseURL: String {
        switch self {
        case .event,.addProduct(product: _):
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
        case .addProduct(product: _):
            return .post
        }
    }

    var body: Encodable? {
        switch self {
        case .event:
            return nil
        case .addProduct(product: let product):
            return product
        }
    }

    var headers: [String : String]? {
        ApiRequestLoader.commonHeaders
    }
}
