//
//  TableViewForCarRepairDetail.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 01/08/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

private let numberOfSectionsForShowDetail: Int = 3
private let zeroDetailItemForShow: Int = 0
private let onlyOneDetailItemForShow: Int = 1
private let descriptionSection: Int = 0
private let weekdaySection: Int = 1
private let reviewsSection: Int = 2

private let heightForTitleHeader: CGFloat = 50.0
private let zeroHeighTitleHeader: CGFloat = 0.0

private let weekdayHeaderTitle: String = "Horário de funcionamento"
private let reviewsHeaderTitle: String = "Avaliações"

class TableViewForCarRepairDetail: NSObject, UITableViewDataSource, UITableViewDelegate {
    var carRepairDetail: CarRepairDetail?
    var accessingNativeComponentsDelegate: NativeComponentsBehavior?

    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSectionsForShowDetail
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == weekdaySection || section == reviewsSection {
            return heightForTitleHeader
        }

        return zeroHeighTitleHeader
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == weekdaySection {
            return weekdayHeaderTitle
        }
        if section == reviewsSection {
            return reviewsHeaderTitle
        }

        return nil
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let carRepairDetail = self.carRepairDetail else {
            return zeroDetailItemForShow
        }

        if section == weekdaySection {
            let carRepair = carRepairDetail.carRepair
            let openingHour = carRepair.openingHour

            guard let weekday = openingHour?.weekday else {
                return zeroDetailItemForShow
            }

            return weekday.count
        }

        if section == reviewsSection {
            let carRepair = carRepairDetail.carRepair
            guard let reviews = carRepair.reviews else {
                return zeroDetailItemForShow
            }

            return reviews.count
        }

        return onlyOneDetailItemForShow
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let section = indexPath.section

        guard let carRepair = self.carRepairDetail?.carRepair else {
            return UITableViewCell()
        }

        if section == descriptionSection {
            let cell: DescriptionTableViewCell = self.configureCell(for: tableView,
                                                                    identifier: DescriptionTableViewCell.identifier,
                                                                    indexPath: indexPath)
            cell.configureDescription(title: carRepair.name,
                                      address: carRepair.formattedAddress,
                                      opened: carRepair.isOpen(),
                                      phone: carRepair.formattedPhoneNumber,
                                      url: carRepair.url,
                                      rating: carRepair.rating)
            cell.phoneAndSiteDelegate = self
            
            return cell
        }
        if section == weekdaySection {
            let cell: WeekdayTableViewCell = self.configureCell(for: tableView,
                                                                identifier: WeekdayTableViewCell.identifier,
                                                                indexPath: indexPath)
            
            guard let openingHour = carRepair.openingHour else {
                return UITableViewCell()
            }
            guard let weekday = openingHour.weekday else {
                return UITableViewCell()
            }
            
            let dayHour = weekday[row]

            cell.configureWeekday(dayHour)

            return cell
        }
        if section == reviewsSection {
            let cell: ReviewsTableViewCell = self.configureCell(for: tableView,
                                                                identifier: ReviewsTableViewCell.identifier,
                                                                indexPath: indexPath)
            guard let reviews = carRepair.reviews else {
                return UITableViewCell()
            }
            let review = reviews[row]
            cell.configureReview(review: review)
            return cell
        }

        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    private func configureCell<T>(for tableView: UITableView, identifier: String, indexPath: IndexPath) -> T where T: UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            return UITableViewCell() as! T
        }
        
        return cell
    }
}
