//
//  AccessNativeComponents.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 03/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

extension TableViewForCarRepairDetail: AccessiblePhoneAndSiteComponents {
    func openSite(_ urlString: String?) {
        guard let urlString = urlString else {
            return
        }

        self.accessingNativeComponentsDelegate?.accessingSafariViewController(urlString)
    }

    func openPhone(_ stringNumber: String?) {
        guard let phoneNumber = stringNumber else {
            return
        }

        self.accessingNativeComponentsDelegate?.callingCarRepair(phoneNumber)
    }
}
