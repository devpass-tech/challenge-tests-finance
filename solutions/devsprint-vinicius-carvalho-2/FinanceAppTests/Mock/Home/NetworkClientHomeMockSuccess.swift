//
//  NetworkClientHomeMockSuccess.swift
//  FinanceAppTests
//
//  Created by vinicius.carvalho on 11/04/22.
//

import Foundation

@testable import FinanceApp

class NetworkClientHomeMockSuccess: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let json: [String: Any] = [
            "balance": 20.43,
            "savings": 10.22,
            "spending": 9.94,
            "activity": [
                "name": "Supermarket",
                "price": 5.9345,
                "time": "11:53"
            ]
        ]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        completion(jsonData)
    }
}
