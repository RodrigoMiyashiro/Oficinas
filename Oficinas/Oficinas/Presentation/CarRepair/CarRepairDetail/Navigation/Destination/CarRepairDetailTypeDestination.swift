//
//  CarRepairDetailTypeDestination.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 01/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class CarRepairDetailTypeDestination: Destination {
    var viewController: UIViewController {
        get {
            return self.initialViewController(ofStoryboard: "CarRepairDetailStoryboard")
        }
    }
}
