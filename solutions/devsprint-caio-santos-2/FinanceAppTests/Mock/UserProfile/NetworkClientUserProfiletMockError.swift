//
//  NetworkClientUserProfiletMockError.swift
//  FinanceAppTests
//
//  Created by Tatiana Rico on 21/03/22.
//

import Foundation
@testable import FinanceApp

class NetworkClientUserProfiletMockError: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let json: [String: Any] = ["balance": 0.7,
                                   "savings": 60,
                                   "spending": 1.0,
                                   "activity": []]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        completion(jsonData)
    }
}
