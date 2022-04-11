//
//  NetworkClientActivityDetailsMockSuccess.swift
//  FinanceAppUITests
//
//  Created by vinicius.carvalho on 09/04/22.
//

import Foundation

@testable import FinanceApp

class NetworkClientMockSuccess: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let json: [String: Any] = [
            "name": "Mall",
            "category": "Shopping",
            "price": 200.0,
            "time": "9:58 AM"
        ]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        completion(jsonData)
    }
}
