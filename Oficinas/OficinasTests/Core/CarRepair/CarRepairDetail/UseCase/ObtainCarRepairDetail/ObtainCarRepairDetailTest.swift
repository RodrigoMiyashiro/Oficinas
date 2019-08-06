//
//  ObtainCarRepairDetailTest.swift
//  OficinasTests
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import XCTest

class ObtainCarRepairDetailTest: XCTestCase {
    var receiver: CarRepairDetailReceiverMock?

    override func setUp() {
        super.setUp()

        self.receiver = CarRepairDetailReceiverMock()
    }

    override func tearDown() {
        self.receiver = nil

        super.tearDown()
    }

    func testObtainCarRepairDetailSuccessfully() {
        let providerMock = CarRepairDetailProviderMock()
        let obtainCarRepairDetail = ObtainCarRepairDetail(provider: providerMock,
                                                          receiver: self.receiver!)

        obtainCarRepairDetail.execute(with: "")

        XCTAssert(providerMock.callsToAvailableCarRepairDetail == 1,
                  "There should be at least 1 call to provider's available obtain Car Repair Detail.")
        XCTAssert(self.receiver?.callToReceiverCarRepairDetail == 1,
                  "There should be at least 1 call to receiver's main method - Successfully.")
    }

    func testObtainCarRepairDetailFailure() {
        let providerMock = CarRepairDetailProviderMockForFailure()
        let obtainCarRepairDetail = ObtainCarRepairDetail(provider: providerMock,
                                                          receiver: self.receiver!)
        
        obtainCarRepairDetail.execute(with: "")
        
        XCTAssert(providerMock.callsToAvailableCarRepairDetail == 1,
                  "There should be at least 1 call to provider's available obtain Car Repair Detail.")
        XCTAssert(self.receiver?.callsToHandleErrorObtainingCarRepairDetail == 1,
                  "There should be at least 1 call to receiver's main method - Failure.")
    }
}
