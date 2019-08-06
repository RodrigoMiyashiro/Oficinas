//
//  CarRepairDetailReceiver.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 30/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol CarRepairDetailReceiver: AnyObject {
    func receiveCarRepairDetail(_ carRepairDetail: CarRepairDetail?)

    func handleErrorObtainingCarRepairDetail()
}
