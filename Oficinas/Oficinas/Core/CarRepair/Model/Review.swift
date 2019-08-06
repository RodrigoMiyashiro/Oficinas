//
//  Review.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 30/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

struct Review: Codable {
    var authorName: String
    var authorURL: String
    var language: String
    var profilePhotoURL: String
    var rating: Double
    var relativeTimeDescription: String
    var text: String
    var time: Int64

    private enum CodingKeys: String, CodingKey {
        case authorName = "author_name"
        case authorURL = "author_url"
        case language, rating, text, time
        case profilePhotoURL = "profile_photo_url"
        case relativeTimeDescription = "relative_time_description"
    }
}
