//
//  ProductModel.swift
//  APIRequestLoader
//
//  Created by Yogesh Raj on 04/07/23.
//

import UIKit

// MARK: - EventDataModel
struct EventDataModel: Codable {
    let events: [Event]?
}

// MARK: - Event
struct Event: Codable {
    let exclusiveIDS: [Int]?
    let date: String?
    let shiftID: Int?
    let endTime: String?
    let eventType: Int?
    let responsiveImages: ResponsiveImages?
    let preSaleDates: String?
    let time, name, preview, urlSlug: String?
    let priceSummary: PriceSummary?
    let imagePreview: String?
    let serviceTypeID: Int?
    let isLive: Bool?
    let generalSaleDate: String?
    let maxPartySize: Int?
    let venue: Venue?
    let isGlobalDiningAccess, isPresale: Bool?

    enum CodingKeys: String, CodingKey {
        case exclusiveIDS = "exclusive_ids"
        case date
        case shiftID = "shift_id"
        case endTime = "end_time"
        case eventType = "event_type"
        case responsiveImages = "responsive_images"
        case preSaleDates = "pre_sale_dates"
        case time, name, preview
        case urlSlug = "url_slug"
        case priceSummary = "price_summary"
        case imagePreview = "image_preview"
        case serviceTypeID = "service_type_id"
        case isLive = "is_live"
        case generalSaleDate = "general_sale_date"
        case maxPartySize = "max_party_size"
        case venue
        case isGlobalDiningAccess = "is_global_dining_access"
        case isPresale = "is_presale"
    }
}

// MARK: - PriceSummary
struct PriceSummary: Codable {
    let maxStr: String?
    let min, max: Int?
    let plusGratuity: Bool?
    let minStr, currency: String?

    enum CodingKeys: String, CodingKey {
        case maxStr = "max_str"
        case min, max
        case plusGratuity = "plus_gratuity"
        case minStr = "min_str"
        case currency
    }
}

// MARK: - ResponsiveImages
struct ResponsiveImages: Codable {
    let originals: Originals?
    let urls: Urls?
    let urlsByResolution: UrlsByResolution?
    let fileNames: [String]?
    let aspectRatios: [String: [String: String]]?

    enum CodingKeys: String, CodingKey {
        case originals, urls
        case urlsByResolution = "urls_by_resolution"
        case fileNames = "file_names"
        case aspectRatios = "aspect_ratios"
    }
}

// MARK: - Originals
struct Originals: Codable {
    let the185F263C877D6Dc29C15572Ac96350Ba1534B4E8: Originals185F263C877D6Dc29C15572Ac96350Ba1534B4E8?

    enum CodingKeys: String, CodingKey {
        case the185F263C877D6Dc29C15572Ac96350Ba1534B4E8 = "185f263c877d6dc29c15572ac96350ba1534b4e8"
    }
}

// MARK: - Originals185F263C877D6Dc29C15572Ac96350Ba1534B4E8
struct Originals185F263C877D6Dc29C15572Ac96350Ba1534B4E8: Codable {
    let url: String?
}

// MARK: - Urls
struct Urls: Codable {
    let the185F263C877D6Dc29C15572Ac96350Ba1534B4E8: [String: [String: String]]?

    enum CodingKeys: String, CodingKey {
        case the185F263C877D6Dc29C15572Ac96350Ba1534B4E8 = "185f263c877d6dc29c15572ac96350ba1534b4e8"
    }
}

// MARK: - UrlsByResolution
struct UrlsByResolution: Codable {
    let the185F263C877D6Dc29C15572Ac96350Ba1534B4E8: [String: The185F263C877D6Dc29C15572Ac96350Ba1534B4E8Value]?

    enum CodingKeys: String, CodingKey {
        case the185F263C877D6Dc29C15572Ac96350Ba1534B4E8 = "185f263c877d6dc29c15572ac96350ba1534b4e8"
    }
}

// MARK: - The185F263C877D6Dc29C15572Ac96350Ba1534B4E8Value
struct The185F263C877D6Dc29C15572Ac96350Ba1534B4E8Value: Codable {
    let the11, the43, the169: String?

    enum CodingKeys: String, CodingKey {
        case the11 = "1:1"
        case the43 = "4:3"
        case the169 = "16:9"
    }
}

// MARK: - Venue
struct Venue: Codable {
    let urlSlug: String?
    let location: Location?
    let id: Int?
    let name, currency: String?

    enum CodingKeys: String, CodingKey {
        case urlSlug = "url_slug"
        case location, id, name, currency
    }
}

// MARK: - Location
struct Location: Codable {
    let code, urlSlug: String?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case code
        case urlSlug = "url_slug"
        case id
    }
}


struct AddProduct: Codable {
    var id: Int? = nil
    let title: String
}
