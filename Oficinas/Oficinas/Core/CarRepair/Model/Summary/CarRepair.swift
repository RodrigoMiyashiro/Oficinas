//
//  CarRepair.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 30/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

struct CarRepair: Codable {
    var formattedAddress: String
    var iconURL: String?
    var identifier: String
    var name: String
    var openingHour: OpeningHour?
    var placeID: String?
    var rating: Double?
    var reference: String?
    var userRatingsTotal: Int?
    var photos: [Photo]?
    var reviews: [Review]?
    var formattedPhoneNumber: String?
    var url: String?
    var vicinity: String?
    var website: String?

    private enum CodingKeys: String, CodingKey {
        case formattedAddress = "formatted_address"
        case iconURL = "icon"
        case identifier = "id"
        case name
        case openingHour = "opening_hours"
        case placeID = "place_id"
        case rating
        case reference
        case userRatingsTotal = "user_ratings_total"
        case photos = "photos"
        case reviews = "reviews"
        case formattedPhoneNumber = "formatted_phone_number"
        case url, vicinity, website
    }
}
