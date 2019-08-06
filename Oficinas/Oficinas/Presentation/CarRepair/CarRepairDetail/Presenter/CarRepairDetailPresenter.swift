//
//  CarRepairDetailPresenter.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 01/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class CarRepairDetailPresenter {
    unowned let screen: CarRepairDetailShowScreen
    unowned let executor: ObtainCarRepairDetailExecutor

    init(screen: CarRepairDetailShowScreen, executor: ObtainCarRepairDetailExecutor) {
        self.screen = screen
        self.executor = executor
    }

    func retrieveCarRepairDetail(withPlaceID placeID: String) {
        do {
            self.executor.obtainCarRepairDetail(placeID) { [weak self] (carRepairDetail, error) in
                self?.prepareForShowScreen(carRepairDetail: carRepairDetail, error: error)
            }
        }
    }

    func prepareForShowScreen(carRepairDetail: CarRepairDetail?, error: Error?) {
        guard error == nil else {
            self.screen.showErrorObtainingCarRepairDetail()
            return
        }

        guard let carRepairDetail = carRepairDetail else {
            self.screen.showErrorObtainingCarRepairDetail()
            return
        }

        self.screen.displayableCarRepairDetail(carRepairDetail)
    }
}
