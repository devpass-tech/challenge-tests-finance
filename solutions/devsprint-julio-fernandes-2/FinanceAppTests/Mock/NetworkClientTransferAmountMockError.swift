//
//  NetworkClientTransferAmountMockError.swift
//  FinanceAppTests
//
//  Created by Tatiana Rico on 25/04/22.
//

import Foundation
@testable import FinanceApp

class NetworkClientTransferAmountMockError: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let json: [String: Any] = ["sucess" : false]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        completion(jsonData)
    }
}
