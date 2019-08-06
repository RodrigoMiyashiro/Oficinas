//
//  CarRepairDetailShowScreen.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 01/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol CarRepairDetailShowScreen: AnyObject {
    func displayableCarRepairDetail(_ carRepairDetail: CarRepairDetail)

    func showErrorObtainingCarRepairDetail()
}
