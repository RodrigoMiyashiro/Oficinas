//
//  CarRepairSummaryShowScreen.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol CarRepairSummaryShowScreen: AnyObject {
    func displayableListCarRepair(_ listCarRepair: ListCarRepairSummary)

    func showErroObtainingListCarRepairSummary()
}
