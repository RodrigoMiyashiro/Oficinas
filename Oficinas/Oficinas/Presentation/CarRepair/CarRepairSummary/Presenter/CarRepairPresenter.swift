//
//  CarRepairPresenter.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class CarRepairPresenter {
    unowned let screen: CarRepairSummaryShowScreen
    unowned let executor: ObtainCarRepairSummaryExecutor

    init(screen: CarRepairSummaryShowScreen, executor: ObtainCarRepairSummaryExecutor) {
        self.screen = screen
        self.executor = executor
    }

    func retrieveListCarRepairSummary(location: String, nextPageToken: String? = nil) {
        do {
            let nextPage = nextPageToken ?? ""
            self.executor.obtainCarRepairSummary(location, nextPageToken: nextPage) { [weak self] (listCarRepairSummary, error) in
                self?.prepareForShowScreen(listCarRepairSummary: listCarRepairSummary, error: error)
            }
        }
    }

    private func prepareForShowScreen(listCarRepairSummary: ListCarRepairSummary?, error: Error?) {
        guard error == nil else {
            self.screen.showErroObtainingListCarRepairSummary()
            return
        }
        
        guard let listCarRepairSummary = listCarRepairSummary else {
            self.screen.showErroObtainingListCarRepairSummary()
            return
        }
        
        self.screen.displayableListCarRepair(listCarRepairSummary)
    }
}
