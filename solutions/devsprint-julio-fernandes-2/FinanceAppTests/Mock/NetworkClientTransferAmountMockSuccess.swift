//
//  NetworkClientTransferAmountMockSuccess.swift
//  FinanceAppTests
//
//  Created by Tatiana Rico on 26/04/22.
//

import Foundation
@testable import FinanceApp

class NetworkClientTransferAmountMockSuccess: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let json: [String: Any] = ["success": true]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        completion(jsonData)
    }
}
