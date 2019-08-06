//
//  ViewBorder.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 05/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension UIView {
    func circularRadius() {
        let middleValue: CGFloat = 2.0
        let frame = self.layer.frame
        let size = frame.size
        let width = size.width
        let radius = width/middleValue

        self.cornerRadius(value: radius)
    }

    func cornerRadius(value: CGFloat) {
        self.layer.cornerRadius = value
        self.layer.masksToBounds = true
    }
}
