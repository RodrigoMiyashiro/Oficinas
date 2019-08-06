//
//  CarRepairSummaryDestination.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 01/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class CarRepairSummaryDestination: Destination {
    private var createdViewController: UIViewController?

    var viewController: UIViewController {
        get {
            if let existingViewController = self.createdViewController {
                return existingViewController
            }

            let destination = self.destinationBuilder()
            let screen = destination.viewController

            return screen
        }
    }
}
