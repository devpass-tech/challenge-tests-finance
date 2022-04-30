//
//  NetworkClientTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 30/04/22.
//

import XCTest
@testable import FinanceApp

final class NetworkClientTests: XCTestCase {

    private var sut: NetworkClient?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = NetworkClient()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_performRequest_returned_success() throws {
        guard let url = makeURL(file: "localSuccessData") else {
            XCTFail("is not valid URL")
            return
        }
        
        sut?.performRequest(with: url) { data in
            XCTAssertNotNil(data)
        }
    }
    
    private func makeURL(file: String) -> URL? {
        guard let bundle = Bundle(for: FinanceService2Tests.self).url(forResource: file, withExtension: "json") else {
            return nil
        }
        return bundle
    }

}
