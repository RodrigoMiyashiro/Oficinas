//
//  OpeningHour.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 30/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

struct OpeningHour: Codable {
    var isOpening: Bool?
    var periods: [Period]?
    var weekday: [String]?

    private enum CodingKeys: String, CodingKey {
        case isOpening = "open_now"
        case periods
        case weekday = "weekday_text"
    }
}
