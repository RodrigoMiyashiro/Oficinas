//
//  ListCarRepairSummary.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 30/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

struct ListCarRepairSummary: Codable {
    var nextPageToken: String?
    var carRepairs: [CarRepair]

    private enum CodingKeys: String, CodingKey {
        case nextPageToken = "next_page_token"
        case carRepairs = "results"
    }
}
