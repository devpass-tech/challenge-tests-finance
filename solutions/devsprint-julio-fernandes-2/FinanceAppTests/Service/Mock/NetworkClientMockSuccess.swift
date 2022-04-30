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

final class NetworkClientHomeDataMockSuccess: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let json: [String: Any] = [
            "balance" : 0,
            "savings" : 0,
            "spending" : 0,
            "activity": [
                [
                    "name": "XXX",
                    "price": 0,
                    "time": "YYY"
                ]
            ]
        ]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        completion(jsonData)
    }
}

final class NetworkClientActivityDetailsMockSuccess: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let json: [String: Any] = [
            "name" : "XXX",
            "price": 0,
            "category": "YYY",
            "time": "ZZZ"
        ]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        completion(jsonData)
    }
}

final class NetworkClientContactListMockSuccess: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let json: [[String: Any]] = [
            [
                "name" : "XXX",
                "phone" : "YYY",
            ]
        ]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        completion(jsonData)
    }
}

final class NetworkClientUserProfileMockSuccess: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let json: [String: Any] = [
            "name" : "XXX",
            "phone" : "XXX",
            "email" : "XXX",
            "address" : "XXX",
            "account" : [
                "agency" : "XXX",
                "account" : "XXX",
            ]
        ]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        completion(jsonData)
    }
}
