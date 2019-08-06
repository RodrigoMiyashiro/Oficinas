//
//  IdentifiableCell.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 02/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol IdentifiableCell: AnyObject { }

extension IdentifiableCell {
    static var identifier: String {
        return String(describing: self)
    }
}
