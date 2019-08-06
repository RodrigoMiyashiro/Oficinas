//
//  CarRepairDetailViewControllerNavigationBehavior.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 02/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

extension CarRepairDetailViewController {
    func showAlert(withMessage message: String) {
        let destination = AlertMessageDestination(title: "Desculpe... :(",
                                                  message: message,
                                                  buttonTitle: "Ok")
        self.present(destination.viewController,
                     animated: true,
                     completion: nil)
    }

    func accessingSafariViewController(_ urlString: String) {
        let destination = SafariViewControllerDestination(urlString: urlString)

        self.present(destination.viewController,
                     animated: true,
                     completion: nil)
    }

    func callingCarRepair(_ phoneNumber: String) {
        let applicationSharedComponent = ApplicationSharedComponent()
        let phoneNumberFull = String(format: "tel://%@",phoneNumber)
        applicationSharedComponent.open(phoneNumberFull)
    }
}
