//
//  Fixtures.swift
//  FinanceAppTests
//
//  Created by Hoff Silva on 2022-06-24.
//

import Foundation

extension Error {
    static func fixture() -> Self {
        NSError(domain: "", code: 0) as! Self
    }
}

extension Data {
    static func fixture() -> Self {
        """
        {
            "name": "Mall",
            "category": "Shopping",
            "price": 100.0,
            "time": "8:57 AM"
        }
        """.data(using: .utf8)!
    }
}
