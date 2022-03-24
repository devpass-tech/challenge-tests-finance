//
//  NetworkClientActivityDetailsMockSuccess.swift
//  FinanceAppTests
//
//  Created by Murillo R. Araújo on 24/03/22.
//

import Foundation
@testable import FinanceApp

class NetworkClientActivityDetailsMockSuccess: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let json: [String: Any] = [
            "name": "Mall",
            "category": "Shopping",
            "price": 100.0,
            "time": "8:57 AM"
        ]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        completion(jsonData)
    }
}
