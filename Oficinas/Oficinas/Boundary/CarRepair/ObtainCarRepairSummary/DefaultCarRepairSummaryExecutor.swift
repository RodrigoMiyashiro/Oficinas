//
//  DefaultCarRepairSummaryExecutor.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class DefaultCarRepairSummaryExecutor: ObtainCarRepairSummaryExecutor, CarRepairSummaryReceiver {
    private var isSuccess = false
    private var obtainCarRepairs: ListCarRepairSummary?

    func obtainCarRepairSummary(_ location: String, nextPageToken: String, completion: @escaping (ListCarRepairSummary?, Error?) -> Void) {
        let clientHTTP = DefaultHTTPClient()
        let provider = DefaultCarRepairSummaryProvider(client: clientHTTP)
        let obtainCarRepairSummary = ObtainCarRepairSumary(provider: provider,
                                                           receiver: self)

        DispatchQueue.global().async {
            obtainCarRepairSummary.execute(with: (location, nextPageToken))

            DispatchQueue.main.async {
                if let obtainedCarRepairSummary = self.obtainCarRepairs, self.isSuccess {
                    completion(obtainedCarRepairSummary, nil)
                } else {
                    completion(nil, ObtainCarRepairSummaryExecutorError.errorObtainingCarRepairSummary)
                }
            }
        }
    }

    func receiveCarRepairSummary(_ carRepairSummary: ListCarRepairSummary?) {
        self.obtainCarRepairs = carRepairSummary
        self.isSuccess = true
    }

    func handleErrorObtainingCarRepairSummary() {
        self.isSuccess = false
    }
}
