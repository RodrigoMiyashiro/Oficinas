//
//  CarRepairSummaryProviderMock.swift
//  OficinasTests
//
//  Created by Rodrigo Miyashiro on 30/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class CarRepairSummaryProviderMock: CarRepairSummaryProvider {
    var callsToAvailableCarRepairSummary = 0

    func carRepairSummary(_ location: String, nextPageToken: String) throws -> ListCarRepairSummary? {
        self.callsToAvailableCarRepairSummary += 1

        return ListCarRepairSummary.validListCarRepairSummary
    }
}
