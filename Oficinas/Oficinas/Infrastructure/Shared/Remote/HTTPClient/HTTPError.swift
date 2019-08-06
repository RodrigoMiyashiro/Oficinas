//
//  HTTPError.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 31/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

enum HTTPError: Error {
    case requestError(_ message: String)
}
