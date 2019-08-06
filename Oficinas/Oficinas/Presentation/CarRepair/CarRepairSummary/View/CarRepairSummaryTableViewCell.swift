//
//  CarRepairSummaryTableViewCell.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class CarRepairSummaryTableViewCell: UITableViewCell, IdentifiableCell {
    @IBOutlet weak var nameCarRepairLabel: UILabel!
    @IBOutlet weak var addressCarRepairLabel: UILabel!
    @IBOutlet weak var itsOpenedCarRepairLabel: UILabel!
    @IBOutlet weak var ratingAndRatingCountCarRepairLabel: UILabel!

    func set(_ carRepair: CarRepair) {
        self.nameCarRepairLabel.text = carRepair.name
        self.addressCarRepairLabel.text = carRepair.formattedAddress

        self.ratingAndRatingCountCarRepairLabel.text = carRepair.ratingString()
    
        let opened = carRepair.isOpen()
        self.itsOpenedCarRepairLabel.text = opened.title
        self.itsOpenedCarRepairLabel.textColor = opened.color
    }
}
