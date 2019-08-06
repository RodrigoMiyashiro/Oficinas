//
//  RemoteProvider.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

private let remoteAddress = RemoteAddress(scheme: "https",
                                          host: "maps.googleapis.com")

protocol RemoteProvider { }

extension RemoteProvider {
    func baseRemoteAddess() -> RemoteAddress {
        return remoteAddress
    }
}
