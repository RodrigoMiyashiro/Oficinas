//
//  WeekdayTableViewCell.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 01/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class WeekdayTableViewCell: UITableViewCell, IdentifiableCell {
    @IBOutlet weak var weekdayLabel: UILabel!

    func configureWeekday(_ dayHour: String?) {
        self.weekdayLabel.text = dayHour
    }
}
