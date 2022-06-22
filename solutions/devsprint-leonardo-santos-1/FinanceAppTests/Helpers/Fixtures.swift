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

extension Error {
    static func fixture() -> Self {
        NSError(domain: "", code: 0) as! Self
    }
}

extension HTTPURLResponse {
    static func succesFixture() -> Self {
        HTTPURLResponse(url: URL.fixture(), statusCode: Int.random(in: 200...299), httpVersion: nil, headerFields: nil) as! Self
    }
    
    static func clientErrorFixture() -> Self {
        HTTPURLResponse(url: URL.fixture(), statusCode: Int.random(in: 400...451), httpVersion: nil, headerFields: nil) as! Self
    }
    
    static func serverErrorFixture() -> Self {
        HTTPURLResponse(url: URL.fixture(), statusCode: Int.random(in: 500...511), httpVersion: nil, headerFields: nil) as! Self
    }
}
