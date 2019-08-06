//
//  DescriptionTableViewCell.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 01/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell, IdentifiableCell {
    var phoneAndSiteDelegate: AccessiblePhoneAndSiteComponents?
    private var urlStringForCarRepairSite: String?

    @IBOutlet weak var titleCarRepairLabel: UILabel!
    @IBOutlet weak var addressCarRepairLabel: UILabel!
    @IBOutlet weak var itsOpenedCarRepairLabel: UILabel!
    @IBOutlet weak var phoneCarRepairLabel: UILabel!
    @IBOutlet weak var siteCarRepairButton: UIButton!
    @IBOutlet weak var ratingAndRatingCountCarRepairLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.configureAccessSiteButton()
        self.configureAccessPhone()
    }

    func configureDescription(title: String, address: String, opened: (title: String, color: UIColor), phone: String?, url: String?, rating: Double?) {
        self.titleCarRepairLabel.text = title
        self.addressCarRepairLabel.text = address
        self.itsOpenedCarRepairLabel.text = opened.title
        self.itsOpenedCarRepairLabel.textColor = opened.color
        self.phoneCarRepairLabel.text = phone
        self.ratingAndRatingCountCarRepairLabel.text = String(format: "%f", rating ?? 0.0)

        self.urlStringForCarRepairSite = url
    }

    private func configureAccessSiteButton() {
        self.siteCarRepairButton.addTarget(self, action: #selector(self.prepareForOpenSite), for: .touchUpInside)
    }

    private func configureAccessPhone() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(self.prepareForOpenPhone))
        tapGesture.numberOfTapsRequired = 1
        self.phoneCarRepairLabel.addGestureRecognizer(tapGesture)
    }

    @objc private func prepareForOpenSite() {
        self.phoneAndSiteDelegate?.openSite(self.urlStringForCarRepairSite)
    }

    @objc private func prepareForOpenPhone() {
        self.phoneAndSiteDelegate?.openPhone(self.phoneCarRepairLabel.text)
    }
}
