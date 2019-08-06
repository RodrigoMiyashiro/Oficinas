//
//  Photo.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 30/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

struct Photo: Codable {
    var height: Int
    var width: Int
    var photoReference: String

    private enum CodingKeys: String, CodingKey {
        case height, width
        case photoReference = "photo_reference"
    }
}
