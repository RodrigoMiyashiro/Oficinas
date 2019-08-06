//
//  CarRepairSummaryReceiverMock.swift
//  OficinasTests
//
//  Created by Rodrigo Miyashiro on 30/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class CarRepairSummaryReceiverMock: CarRepairSummaryReceiver {
    var callsToReceiverCarRepairSummary = 0
    var callsToHandleErrorObtainingCarRepairSummary = 0

    var obtainCarRepairSummary: ListCarRepairSummary?

    func receiveCarRepairSummary(_ carRepairSummary: ListCarRepairSummary?) {
        self.callsToReceiverCarRepairSummary += 1

        self.obtainCarRepairSummary = carRepairSummary
    }

    func handleErrorObtainingCarRepairSummary() {
        self.callsToHandleErrorObtainingCarRepairSummary += 1
    }
}
