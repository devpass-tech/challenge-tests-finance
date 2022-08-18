//
//  FinanceServiceTests.swift
//  FinanceAppTests
//
//  Created by Thiago Cezario on 17/08/22.
//

import XCTest
@testable import FinanceApp

final class FinanceServiceTests: XCTestCase {
    var url: URL!
    
    override func setUp() {
        url = URL(string: "https://www.testURL.com")!
    }
    
    override func tearDown() {
        url = nil
    }
    
    func testFetchActivityDetailsSuccess() {
        let networkClient = NetworkClientMock()
        
        networkClient.performRequest(with: url) { data in
            guard let data = data else {
                XCTFail()
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let activityDetails = try? decoder.decode(ActivityDetails.self, from: data) else {
                XCTFail()
                return
            }
            
            XCTAssertNotNil(activityDetails)
        }
    }
    
    func testFetchActivityDetailsFailure() {
        let networkClient = NetworkClientMock()
        networkClient.shouldSucceed = false
        
        networkClient.performRequest(with: url) { data in
            XCTAssertNil(data)
        }
    }
}
