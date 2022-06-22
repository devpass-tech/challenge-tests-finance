//
//  Fixtures.swift
//  FinanceAppTests
//
//  Created by Hoff Silva on 2022-06-22.
//

import Foundation

extension URL {
    static func fixture() -> Self {
        URL(string: "https://")!
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
