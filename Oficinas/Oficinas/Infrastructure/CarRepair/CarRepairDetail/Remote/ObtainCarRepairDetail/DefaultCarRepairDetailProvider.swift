//
//  DefaultCarRepairDetailProvider.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class DefaultCarRepairDetailProvider: CarRepairDetailProvider, RemoteProvider, RemoteParametersProvider {
    private let client: HTTPClient

    init(client: HTTPClient) {
        self.client = client
    }

    func carRepairDetail(_ placeID: String) throws -> CarRepairDetail? {
        let path = "/maps/api/place/details/json"
        let url = self.baseRemoteAddess().appendedPath(path)
        let parameters = ["placeid":placeID,
                          "key":self.key,
                          "language":self.language,
                          "fields":self.fieldsForCarRepairDetail]

        guard let carRepairDetail: CarRepairDetail = try self.client.request(url,
                                                                             httpMethod: .get,
                                                                             queryParamenters: parameters,
                                                                             headerParamenters: nil,
                                                                             bodyParamenters: nil) else {
            throw CarRepairDetailProviderError.errorObtainingCarRepairDetail
        }

        return carRepairDetail
    }
}
