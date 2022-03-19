//
//  FinanceServiceTests.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 17/03/22.
//

import XCTest
@testable import FinanceApp

class FinanceServiceTests: XCTestCase {
  
    func test_transferAmount_WithValidJson_ShouldReturnParsedObject() {
        let sut = FinanceService(networkClient: NetworkClientMockSuccess())
        sut.transferAmount { result in
            XCTAssertNotNil(result)
            XCTAssertTrue(result?.success ?? false)
        }
    }
    
    func test_transferAmount_WithInvalidJson_ShouldReturnNil() {
        let sut = FinanceService(networkClient: NetworkClientMockError())
        sut.transferAmount { result in
            XCTAssertNil(result)
        }
    }

    func test_transferAmount_WithVilValue_ShouldReturnNil() {
        let sut = FinanceService(networkClient: NetworkClientMockNil())
        sut.transferAmount { result in
            XCTAssertNil(result)
        }
    }
}

class NetworkClientMockError: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let json: [String: Any] = ["balance": 0.7,
                                   "savings": 60,
                                   "spending": 1.0,
                                   "activity": []]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        completion(jsonData)
    }
}

class NetworkClientMockSuccess: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let json: [String: Any] = ["success": true]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        completion(jsonData)
    }
}

class NetworkClientMockNil: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        completion(nil)
    }
}
