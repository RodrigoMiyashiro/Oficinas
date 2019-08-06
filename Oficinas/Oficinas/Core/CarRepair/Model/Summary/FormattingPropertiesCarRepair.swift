//
//  FormattingPropertiesCarRepair.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 05/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension CarRepair {
    func ratingString() -> String {
        return String(format: "%.2f(%d)", self.rating ?? 0, self.userRatingsTotal ?? 0)
    }
    
    func isOpen() -> (title: String, color: UIColor) {
        var title = ""
        var color: UIColor = .white
        
        if let isOpened = self.openingHour?.isOpening {
            title = isOpened ? "Aberto" : "Fechado"
            color = isOpened ? .green : .red
        }
        
        return (title, color)
    }
}
