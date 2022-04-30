//
//  NetworkClientTransferAmountMockError.swift
//  FinanceAppTests
//
//  Created by Tatiana Rico on 25/04/22.
//

import Foundation
@testable import FinanceApp

final class NetworkClientTransferAmountMockError: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let json: [String: Any] = ["sucess" : false]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        completion(jsonData)
    }
}

final class NetworkClientHomeDataMockError: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let json: [String: Any] = ["balance" : 0]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        completion(jsonData)
    }
}

final class NetworkClientActivityDetailsMockError: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let json: [String: Any] = ["name" : "XXX"]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        completion(jsonData)
    }
}

final class NetworkClientContactListMockError: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let json: [[String: Any]] = [["name" : "XXX"]]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        completion(jsonData)
    }
}

final class NetworkClientUserProfileMockError: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let json: [String: Any] = ["name" : "XXX"]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        completion(jsonData)
    }
}
