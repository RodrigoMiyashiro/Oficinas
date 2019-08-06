//
//  ObtainCarRepairDetailExecutor.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol ObtainCarRepairDetailExecutor: AnyObject {
    func obtainCarRepairDetail(_ placeID: String, completion: @escaping(CarRepairDetail?, Error?) -> Void)
}
