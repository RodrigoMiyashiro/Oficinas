//
//  RemoteParametersProvider.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol RemoteParametersProvider { }

extension RemoteParametersProvider {
    var radius: String {
        return "500"
    }

    var type: String {
        return "car_repair"
    }

    var key: String {
        return "AIzaSyDSS3vIvjawcqcFa-0rH_PXTg8UstDV1sE"
    }

    var language: String {
        return "pt_BR"
    }

    var fieldsForCarRepairSummary: String {
        return "formatted_address,icon,id,name,place_id,reference,opening_hours,rating,user_ratings_total"
    }

    var fieldsForCarRepairDetail: String {
        return String(format: "%@,%@",
                      self.fieldsForCarRepairSummary,
                      "photos,types,url,vicinity,website,formatted_phone_number,international_phone_number,reviews")
    }

    var maxWidthAuthorPhoto: String {
        return "50"
    }
}
