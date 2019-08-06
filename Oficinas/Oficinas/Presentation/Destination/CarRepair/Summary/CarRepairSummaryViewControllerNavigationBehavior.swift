//
//  CarRepairSummaryViewControllerNavigationBehavior.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 01/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

extension ListCarRepairSummaryViewController: DetailProtocol {
    func showAlert(withMessage message: String) {
        let destination = AlertMessageDestination(title: "Desculpe... :(",
                                                  message: message,
                                                  buttonTitle: "Ok")
        self.present(destination.viewController,
                     animated: true,
                     completion: nil)
    }

    func openCarRepairDetail(withPlaceID placeID: String) {
        let destination = CarRepairDetailDestination(placeID: placeID)

        self.navigator?.set(current: self)
        self.navigator?.navigate(to: destination,
                                 mode: .fromCurrent)
    }
}

protocol DetailProtocol: AnyObject {
    func openCarRepairDetail(withPlaceID placeID: String)
}
