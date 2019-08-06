//
//  ObtainCarRepairDetail.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 30/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class ObtainCarRepairDetail: ParameterizedUseCase {
    typealias Parameters = String
    private let provider: CarRepairDetailProvider
    private weak var receiver: CarRepairDetailReceiver?

    init(provider: CarRepairDetailProvider, receiver: CarRepairDetailReceiver) {
        self.provider = provider
        self.receiver = receiver
    }

    func execute(with parameters: String) {
        do {
            let carRepairDetail = try self.provider.carRepairDetail(parameters)

            self.receiver?.receiveCarRepairDetail(carRepairDetail)
        } catch {
            self.receiver?.handleErrorObtainingCarRepairDetail()
        }
    }
}
