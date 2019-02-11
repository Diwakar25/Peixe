//
//  CommonModels.swift
//  Peixe
//
//  Created by Gabriel vieira on 2/10/19.
//  Copyright © 2019 Gabriel vieira. All rights reserved.
//

import Foundation

// MARK: Deal ViewModel
struct DealViewModel {
    
    var deals: [DealItemViewModel]
    var banners: [BannerItemViewModel]
}

struct DealItemViewModel {
    
    var imageUrl: URL?
    var partnerName: String
    var dealName: String
    var fullPrice: String
    var salePrice: String
    var dealID: String
}

struct BannerItemViewModel {
    
}

// MARK: Deal Service Models
struct DealResponse: Codable {
    let code: Int
    let response: Response
}

struct Response: Codable {
    let hasMore: Bool
    let banners: [Banner]
    let deals: [Deal]
}

struct Banner: Codable {
    
    let name, title, label: String
    let priority: Int
    let startDate, endDate: String
    let mobile: Mobile
    let isIos, isAndroid: Bool
    
    enum CodingKeys: String, CodingKey {
        case name, title, label, priority
        case startDate = "start_date"
        case endDate = "end_date"
        case mobile
        case isIos = "is_ios"
        case isAndroid = "is_android"
    }
}

struct Mobile: Codable {
    
    let mobileImage: String
    let type: Int
    let active: Bool
    
    enum CodingKeys: String, CodingKey {

        case mobileImage = "mobile_image"
        case type, active
    }
}

struct Deal: Codable {
    
    let dealID, contractNumber, contractID: String
    let title, shortTitle: String
    let partner: Partner
    let images: [Image]
    let canonicalURL: String
    let shortenedURL: String
    let fullPrice, salePrice: Double
    let percentageSaved: String
    let dealImage: String
    let dealOriginalImage: String
    
    enum CodingKeys: String, CodingKey {

        case dealID = "deal_id"
        case contractNumber = "contract_number"
        case contractID = "contract_id"
        case title
        case shortTitle = "short_title"
        case partner
        case images
        case canonicalURL = "canonical_url"
        case shortenedURL = "shortened_url"
        case fullPrice = "full_price"
        case salePrice = "sale_price"
        case percentageSaved = "percentage_saved"
        case dealImage, dealOriginalImage
    }
}

struct Image: Codable {
    let image, thumb: String
    let original: String
}

struct Location: Codable {
    let lat, lon: Double
}

struct Partner: Codable {
    
    let accountID, description, name, neighborhood: String
    let address, number, additionalAddressInfo, city: String
    let state, zipCode, phoneNumber: String
    let website: String
    let formattedURL: String
    let image: String
    let companyName, cnpj: String
    let canonicalURL: String
    let location: Location?
    let lat, lng: Double?
    let placeName: String
    let citySlug, neighborhoodSlugName: String?
    
    enum CodingKeys: String, CodingKey {
        case accountID = "account_id"
        case description, name, neighborhood, address, number
        case additionalAddressInfo = "additional_address_info"
        case city, state
        case zipCode = "zip_code"
        case phoneNumber = "phone_number"
        case website
        case formattedURL = "formatted_url"
        case image
        case companyName = "company_name"
        case cnpj
        case canonicalURL = "canonical_url"
        case location, lat, lng
        case placeName = "place_name"
        case citySlug = "city_slug"
        case neighborhoodSlugName = "neighborhood_slug_name"
    }
}
