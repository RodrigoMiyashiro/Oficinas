//
//  CarRepairDetail.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 30/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

struct CarRepairDetail: Codable {
    var carRepair: CarRepair
    var status: String

    private enum CodingKeys: String, CodingKey {
        case carRepair = "result"
        case status
    }
}
