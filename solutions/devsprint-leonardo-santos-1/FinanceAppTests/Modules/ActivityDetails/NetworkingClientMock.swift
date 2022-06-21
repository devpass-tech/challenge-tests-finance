//
//  NetworkingClientMock.swift
//  FinanceAppTests
//
//  Created by Hoff Silva on 2022-06-20.
//

import Foundation

@testable import FinanceApp

struct NetworkingClientMock: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let data = """
        {
            "name": "Mall",
            "category": "Shopping",
            "price": 100.0,
            "time": "8:57 AM"
        }
        """.data(using: .utf8)

        completion(data)
    }
}
