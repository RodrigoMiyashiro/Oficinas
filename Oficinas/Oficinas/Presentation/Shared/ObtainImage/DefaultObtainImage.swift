//
//  DefaultObtainImage.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func downloadImage(withURL urlString: String?, placeholder: String) {
        let imagePlaceholder = UIImage(named: placeholder)

        guard let urlString = urlString else {
            self.image = imagePlaceholder
            return
        }

        guard let imageURL = URL(string: urlString) else {
            self.image = imagePlaceholder
            return
        }

        self.kf.indicatorType = .activity
        self.kf.indicator?.startAnimatingView()
        self.kf.setImage(with: ImageResource(downloadURL: imageURL), placeholder: imagePlaceholder)
        self.kf.indicator?.stopAnimatingView()
    }
}
