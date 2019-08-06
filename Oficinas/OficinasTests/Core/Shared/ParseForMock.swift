//
//  ParseForMock.swift
//  Oficinas
//
//  Created by Rodrigo Miyashiro on 30/07/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class ParseForMock {
    func parseData<T>(fileName: String, ofType: String) -> T? where T: Decodable {
        var responseData: T?

        let bundle = Bundle(for: type(of: self))
    
        guard let path = bundle.path(forResource: fileName, ofType: ofType) else {
            return nil
        }

        let url = URL(fileURLWithPath: path)

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            responseData = try decoder.decode(T.self, from: data)
        } catch {
            print("🕵️‍♂️ Error...")
        }

        return responseData
    }
}
