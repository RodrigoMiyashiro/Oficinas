//
//  ObtainCarRepairSummaryTest.swift
//  OficinasTests
//
//  Created by Rodrigo Miyashiro on 30/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import XCTest

class ObtainCarRepairSummaryTest: XCTestCase {
    var receiver: CarRepairSummaryReceiverMock?

    override func setUp() {
        super.setUp()

        self.receiver = CarRepairSummaryReceiverMock()
    }

    override func tearDown() {
        self.receiver = nil

        super.tearDown()
    }

    func testObtainListCarRepairSummarySuccessfully() {
        let providerMock = CarRepairSummaryProviderMock()
        let obtainListCarRepairSummary = ObtainCarRepairSumary(provider: providerMock,
                                                               receiver: self.receiver!)

        obtainListCarRepairSummary.execute(with: ("location", "nextPageToken"))

        XCTAssert(providerMock.callsToAvailableCarRepairSummary == 1,
                  "There should be at least 1 call to provider's available obtain car repair summary.")
        XCTAssert(self.receiver?.callsToReceiverCarRepairSummary == 1,
                  "There should be at least 1 call to receiver's main method - Successfully.")
    }

    func testObrainListCarRepairSummaryFailure() {
        let providerMock = CarRepairSummaryProviderMockForFailure()
        let obtainListCarRepairSummary = ObtainCarRepairSumary(provider: providerMock,
                                                               receiver: self.receiver!)
        
        obtainListCarRepairSummary.execute(with: ("location", "nextPageToken"))
        
        XCTAssert(providerMock.callsToAvailableCarRepairSummary == 1,
                  "There should be at least 1 call to provider's available obtain car repair summary.")
        XCTAssert(self.receiver?.callsToHandleErrorObtainingCarRepairSummary == 1,
                  "There should be at least 1 call to receiver's main method - Failure.")
    }
}
