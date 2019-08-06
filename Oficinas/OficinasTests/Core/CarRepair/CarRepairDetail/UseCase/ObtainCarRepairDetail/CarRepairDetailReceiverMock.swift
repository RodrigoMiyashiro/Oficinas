//
//  CarRepairDetailReceiverMock.swift
//  OficinasTests
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class CarRepairDetailReceiverMock: CarRepairDetailReceiver {
    var callToReceiverCarRepairDetail = 0
    var callsToHandleErrorObtainingCarRepairDetail = 0

    var carRepairDetail: CarRepairDetail?

    func receiveCarRepairDetail(_ carRepairDetail: CarRepairDetail?) {
        self.callToReceiverCarRepairDetail += 1
    
        self.carRepairDetail = carRepairDetail
    }

    func handleErrorObtainingCarRepairDetail() {
        self.callsToHandleErrorObtainingCarRepairDetail += 1
    }
}
