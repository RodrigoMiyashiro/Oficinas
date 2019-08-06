//
//  DefaultCarRepairDetailExecutor.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class DefaultCarRepairDetailExecutor: ObtainCarRepairDetailExecutor, CarRepairDetailReceiver {
    private var isSuccess = false
    private var obtainCarRepairDetail: CarRepairDetail?

    func obtainCarRepairDetail(_ placeID: String, completion: @escaping (CarRepairDetail?, Error?) -> Void) {
        let clientHTTP = DefaultHTTPClient()
        let provider = DefaultCarRepairDetailProvider(client: clientHTTP)
        let obtainCarRepairDetail = ObtainCarRepairDetail(provider: provider,
                                                          receiver: self)

        DispatchQueue.global().async {
            obtainCarRepairDetail.execute(with: placeID)

            DispatchQueue.main.async {
                if let obtainedCarRepairDetail = self.obtainCarRepairDetail, self.isSuccess {
                    completion(obtainedCarRepairDetail, nil)
                } else {
                    completion(nil, ObtainCarRepairDetailExecutorError.errorObtainingCarRepairDetail)
                }
            }
        }
    }

    func receiveCarRepairDetail(_ carRepairDetail: CarRepairDetail?) {
        self.obtainCarRepairDetail = carRepairDetail
        self.isSuccess = true
    }

    func handleErrorObtainingCarRepairDetail() {
        self.isSuccess = false
    }
}
