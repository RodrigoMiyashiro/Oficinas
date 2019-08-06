//
//  ObtainCarRepairSummaryExecutor.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol ObtainCarRepairSummaryExecutor: AnyObject {
    func obtainCarRepairSummary(_ location: String, nextPageToken: String, completion: @escaping(ListCarRepairSummary?, Error?) -> Void)
}
