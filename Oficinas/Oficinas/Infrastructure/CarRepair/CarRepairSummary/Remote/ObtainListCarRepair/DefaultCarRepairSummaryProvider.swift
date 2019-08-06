//
//  DefaultCarRepairSummaryProvider.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class DefaultCarRepairSummaryProvider: CarRepairSummaryProvider, RemoteProvider, RemoteParametersProvider {
    private let client: HTTPClient

    init(client: HTTPClient) {
        self.client = client
    }

    func carRepairSummary(_ location: String, nextPageToken: String) throws -> ListCarRepairSummary? {
        let path = "/maps/api/place/textsearch/json"
        let url = self.baseRemoteAddess().appendedPath(path)
        let parameters = ["location": location,
                          "radius": self.radius,
                          "types": self.type,
                          "key": self.key,
                          "language": self.language,
                          "fields": self.fieldsForCarRepairSummary,
                          "pagetoken": nextPageToken]

        guard let listCarRepairSummary: ListCarRepairSummary = try self.client.request(url,
                                                                                       httpMethod: .get,
                                                                                       queryParamenters: parameters,
                                                                                       headerParamenters: nil,
                                                                                       bodyParamenters: nil) else {
            throw CarRepairSummaryProviderError.errorObtainingCarRepairSummary
        }

        return listCarRepairSummary
    }
}
