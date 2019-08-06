//
//  ObtainCarRepairSummary.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 30/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class ObtainCarRepairSumary: ParameterizedUseCase {
    typealias Parameters = (location: String, nextPageToken: String)
    private let provider: CarRepairSummaryProvider
    private weak var receiver: CarRepairSummaryReceiver?

    init(provider: CarRepairSummaryProvider, receiver: CarRepairSummaryReceiver) {
        self.provider = provider
        self.receiver = receiver
    }

    func execute(with parameters: (location: String, nextPageToken: String)) {
        do {
            let listCarRepair = try self.provider.carRepairSummary(parameters.location,
                                                                   nextPageToken: parameters.nextPageToken)

            self.receiver?.receiveCarRepairSummary(listCarRepair)
        } catch {
            self.receiver?.handleErrorObtainingCarRepairSummary()
        }
    }
}
