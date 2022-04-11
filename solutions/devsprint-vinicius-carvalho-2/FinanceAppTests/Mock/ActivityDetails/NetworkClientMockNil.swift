//
//  NetworkClientActivityDetailsMockNil.swift
//  FinanceAppUITests
//
//  Created by vinicius.carvalho on 09/04/22.
//

import XCTest

@testable import FinanceApp

class NetworkClientMockNil: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        completion(nil)
    }
}
