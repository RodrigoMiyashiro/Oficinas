//
//  TableViewForCarRepairSummary.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

private let numberOfSectionsForListCarRepair: Int = 1
private let zeroCarRepairsItems: Int = 0

class TableViewForCarRepairSummary: NSObject, UITableViewDataSource, UITableViewDelegate {
    var listCarRepairSummary: ListCarRepairSummary?
    var delegateForDetail: DetailProtocol?

    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSectionsForListCarRepair
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let listCarRepair = self.listCarRepairSummary?.carRepairs else {
            return zeroCarRepairsItems
        }

        return listCarRepair.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifer = CarRepairSummaryTableViewCell.identifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer,
                                                       for: indexPath) as? CarRepairSummaryTableViewCell else {
            return UITableViewCell()
        }

        let row = indexPath.row

        if let listCarRepair = self.listCarRepairSummary?.carRepairs {
            let carRepair = listCarRepair[row]
            cell.set(carRepair)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let row = indexPath.row

        guard let carRepairSelected = self.listCarRepairSummary?.carRepairs[row] else {
            return
        }

        if let placeID = carRepairSelected.placeID {
            self.delegateForDetail?.openCarRepairDetail(withPlaceID: placeID)
        }
    }
}
