//
//  ReviewsTableViewCell.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 01/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell, IdentifiableCell {
    @IBOutlet weak var photoAuthorReviewImage: UIImageView!
    @IBOutlet weak var nameAuthorReviewLabel: UILabel!
    @IBOutlet weak var descriptionAuthorReviewLabel: UILabel!
    @IBOutlet weak var relativeTimeAuthorReviewLabel: UILabel!
    @IBOutlet weak var ratingAuthorReviewLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.configureAuthorImage()
    }

    private func configureAuthorImage() {
        self.photoAuthorReviewImage.circularRadius()
    }

    func configureReview(review: Review) {
        self.photoAuthorReviewImage.downloadImage(withURL: review.profilePhotoURL,
                                                  placeholder: "ic_profile_placeholder")
        self.nameAuthorReviewLabel.text = review.authorName
        self.descriptionAuthorReviewLabel.text = review.text
        self.relativeTimeAuthorReviewLabel.text = review.relativeTimeDescription
        self.ratingAuthorReviewLabel.text = String(format: "%.2f", review.rating)
    }
}
