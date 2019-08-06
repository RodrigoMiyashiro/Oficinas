//
//  CarRepairDetailProviderMockForFailure.swift
//  OficinasTests
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class CarRepairDetailProviderMockForFailure: CarRepairDetailProvider {
    var callsToAvailableCarRepairDetail = 0

    func carRepairDetail(_ placeID: String) throws -> CarRepairDetail? {
        self.callsToAvailableCarRepairDetail += 1
    
        throw CarRepairDetailProviderError.errorObtainingCarRepairDetail
    }
}
