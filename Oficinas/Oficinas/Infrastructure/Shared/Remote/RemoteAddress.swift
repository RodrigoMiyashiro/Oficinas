//
//  RemoteAddress.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

struct RemoteAddress {
    private let scheme: String
    private let host: String
    private let path: String?

    init(scheme: String, host: String, path: String? = nil) {
        self.scheme = scheme
        self.host = host
        self.path = path
    }

    func appendedPath(_ path: String) -> RemoteAddress {
        return RemoteAddress(scheme: self.scheme, host: self.host, path: path)
    }

    func urlComponents(parameters: [String: String]?) -> URLComponents {
        var urlComponents = self.urlComponent()
        var queryItems = [URLQueryItem]()

        guard let parameters = parameters else {
            return urlComponents
        }

        parameters.forEach { queryItems.append(URLQueryItem(name: $0.key, value: $0.value)) }

        urlComponents.queryItems = queryItems

        return urlComponents
    }

    func urlComponent() -> URLComponents {
        var urlComponent = URLComponents()
        urlComponent.scheme = self.scheme
        urlComponent.host = self.host

        if let path = self.path {
            urlComponent.path = path
        }

        return urlComponent
    }
}
