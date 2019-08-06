//
//  CarRepairSummaryProvider.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 30/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol CarRepairSummaryProvider: AnyObject {
    func carRepairSummary(_ location: String, nextPageToken: String) throws -> ListCarRepairSummary?
}
