//
//  CarRepairDetailTestData.swift
//  OficinasTests
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension CarRepairDetail {
    static var validCarRepairDetail: CarRepairDetail {
        let parser = ParseForMock()
        let carRepairDetail: CarRepairDetail? = parser.parseData(fileName: "CarRepairDetailTest",
                                                                 ofType: "json")

        return carRepairDetail!
    }
}
