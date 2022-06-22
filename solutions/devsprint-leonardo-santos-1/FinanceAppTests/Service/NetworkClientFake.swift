//
//  NetworkClientFake.swift
//  FinanceAppTests
//
//  Created by Junior Margalho on 22/06/22.
//

@testable import FinanceApp
import Foundation

final class NetworkClientFake: NetworkClientProtocol {

    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let data: Data? =
        """
        {
          "balance": 15459.27,
          "savings": 1000.0,
          "spending": 500.0,
          "activity": [
            {
              "name": "Mall",
              "price": 100.0,
              "time": "8:57 AM"
            }
          ]
        }
        """.data(using: .utf8)
        completion(data)
    }
}
