//
//  ListCarRepairSummaryTestData.swift
//  OficinasTests
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension ListCarRepairSummary {
    static var validListCarRepairSummary: ListCarRepairSummary {
        let parser = ParseForMock()
        let listcarRepairSummary: ListCarRepairSummary? = parser.parseData(fileName: "ListCarRepairSummaryTest",
                                                                           ofType: "json")

        return listcarRepairSummary!
    }
}
