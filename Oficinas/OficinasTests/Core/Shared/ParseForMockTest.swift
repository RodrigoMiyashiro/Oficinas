//
//  ParseForMockTest.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 30/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import XCTest

class ParseForMockTest: XCTestCase {
    private var parseForMock: ParseForMock?

    override func setUp() {
        super.setUp()

        self.parseForMock = ParseForMock()
    }

    override func tearDown() {
        self.parseForMock = nil

        super.tearDown()
    }

    func testObtainListCarRepairSummaryForMock() {
        let listCarRepairSummary: ListCarRepairSummary? = self.parseForMock?.parseData(fileName: "ListCarRepairSummaryTest", ofType: "json")
    
        XCTAssert(listCarRepairSummary != nil, "It's a ListCarRepairSummary.")
    }

    func testObtainCarRepairDetailForMock() {
        let carRepairDetail: CarRepairDetail? = self.parseForMock?.parseData(fileName: "CarRepairDetailTest", ofType: "json")

        XCTAssert(carRepairDetail != nil, "It's a CarRepairDetail.")
    }
}
