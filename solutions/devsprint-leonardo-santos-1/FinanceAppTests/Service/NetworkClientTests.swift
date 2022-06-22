//
//  NetworkClientTests.swift
//  FinanceAppTests
//
//  Created by Hoff Silva on 2022-06-20.
//

import XCTest

@testable import FinanceApp

final class NetworkClientTests: XCTestCase {
    
    func test_performRequest_whenURLisInvalid_shouldReturnNil() {
        let sut = NetworkClient()
        let invalidURL = URL(string: "https://www.google.com")!
        URLProtocol.registerClass(URLProtocolStub.self)
        sut.performRequest(with:invalidURL , completion: { data in
            XCTAssertNil(data)
        })
    }
    
}
