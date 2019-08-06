//
//  TypesTableViewCell.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 01/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class TypesTableViewCell: UITableViewCell, IdentifiableCell {
    @IBOutlet weak var typeServiceCarRepairLabel: UILabel!

    func configureTypes(_ type: String) {
        self.typeServiceCarRepairLabel.text = type
    }
}
