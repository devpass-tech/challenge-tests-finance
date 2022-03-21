//
//  NetworkClientUserProfiletMockSuccess.swift
//  FinanceAppTests
//
//  Created by Tatiana Rico on 21/03/22.
//

import Foundation
@testable import FinanceApp

class NetworkClientUserProfiletMockSuccess: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let json: [String: Any] = ["name": "Tatiana",
                                   "phone": "1188883333",
                                   "email": "teste@gmail.com",
                                   "address": "Rua ggggg 33",
                                   "account": ["agency": "234",
                                               "account": "34566"]
                                   ]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        completion(jsonData)
    }
}

