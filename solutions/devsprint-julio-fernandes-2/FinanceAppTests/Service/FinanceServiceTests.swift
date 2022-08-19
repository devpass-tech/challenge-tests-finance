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
        url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/activity_details_endpoint.json")!
    }
    
    override func tearDown() {
        url = nil
    }
    
    func testFetchActivityDetailsSuccess() {
        let expectedActivityDetails = ActivityDetails(name: "Marvel", price: 10.00, category: "Movie", time: "21:00")
        let networkClient = NetworkClientSuccessStub(fileName: "ActivityDetails")
        let sut = FinanceService(networkClient: networkClient)
        
        var actualActivityDetails: ActivityDetails?
        
        sut.fetchActivityDetails { activityDetails in
            actualActivityDetails = activityDetails
        }
        
        XCTAssertEqual(actualActivityDetails, expectedActivityDetails)
        XCTAssert(networkClient.callCount == 1)
        XCTAssertEqual(networkClient.url, self.url)
    }
    
    func testFetchActivityDetailsFailure() {
        let networkClient = NetworkClientFailureStub()
        let sut = FinanceService(networkClient: networkClient)
        
        var actualActivityDetails: ActivityDetails?
        
        sut.fetchActivityDetails { activityDetails in
            actualActivityDetails = activityDetails
        }
        
        XCTAssertNil(actualActivityDetails)
        XCTAssert(networkClient.callCount == 1)
        XCTAssertEqual(networkClient.url, self.url)
    }
    
    func test_fetchActivityDetails_wrongData() {
        let networkClient = NetworkClientSuccessStub(fileName: "ActivityDetailsInvalid")
        let sut = FinanceService(networkClient: networkClient)
        var actualActivityDetails: ActivityDetails?
        
        sut.fetchActivityDetails { activityDetails in
            actualActivityDetails = activityDetails
        }
        
        XCTAssertNil(actualActivityDetails)
        XCTAssert(networkClient.callCount == 1)
        XCTAssertEqual(networkClient.url, self.url)
    }
}
