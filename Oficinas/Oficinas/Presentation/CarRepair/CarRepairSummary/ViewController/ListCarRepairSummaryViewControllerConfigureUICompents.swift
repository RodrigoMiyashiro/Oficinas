//
//  ListCarRepairSummaryViewControllerConfigureUICompents.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 05/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension ListCarRepairSummaryViewController: UITextFieldDelegate {
    internal func configureTableView() {
        self.dataSourceDelegateForCarRepairSummaryTableView.delegateForDetail = self
        
        self.carRepairSummaryTableView.dataSource = self.dataSourceDelegateForCarRepairSummaryTableView
        self.carRepairSummaryTableView.delegate = self.dataSourceDelegateForCarRepairSummaryTableView
        self.carRepairSummaryTableView.tableFooterView = UIView()
    }
    
    internal func configureAddressTextField() {
        self.inputAddressTextField.delegate = self
    }

    internal func configureAddressButton() {
        let radius: CGFloat = 10.0
        self.searchAddressButton.cornerRadius(value: radius)
        self.searchAddressButton.addTarget(self,
                                           action: #selector(self.searchCarRepairWithAddress),
                                           for: UIControl.Event.touchUpInside)
    }

    @objc private func searchCarRepairWithAddress() {
        self.inputAddressTextField.resignFirstResponder()

        guard let address = self.inputAddressTextField.text, address != "" else {
            self.showAlert(withMessage: "Informe um endereço para localizar as oficinas mais próximas.")
            return
        }

        self.convertAddressToCoordinate(address) { (coordinateConverted) in
            let coordinateString = self.convertCoordinateToString(coordinateConverted)
            if coordinateString == "" {
                return
            }

            self.coordinate = coordinateConverted
            self.initialRequest(withLocation: coordinateString)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.inputAddressTextField.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.inputAddressTextField.resignFirstResponder()
        self.searchCarRepairWithAddress()

        return true
    }
}
