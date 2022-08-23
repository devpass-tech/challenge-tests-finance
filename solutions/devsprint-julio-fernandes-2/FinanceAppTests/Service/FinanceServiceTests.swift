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
    
    func test_FetchActivityDetails_succeeds_whenJSONIsValid() {
        let expectedActivityDetails = ActivityDetails(name: "Marvel", price: 10.00, category: "Movie", time: "21:00")
        let networkClient = NetworkClientSuccessStub(fileName: "ActivityDetails")
        let sut = FinanceService(networkClient: networkClient)
        
        var actualActivityDetails: ActivityDetails?
        
        sut.fetchActivityDetails { activityDetails in
            actualActivityDetails = activityDetails
        }
        
        XCTAssertEqual(actualActivityDetails, expectedActivityDetails)
        XCTAssertEqual(networkClient.callCount, 1)
        XCTAssertEqual(networkClient.url, self.url)
    }
    
    func test_fetchActivityDetails_whenNetworkingReturnsNilData_returnsNil() {
        let networkClient = NetworkClientFailureStub()
        let sut = FinanceService(networkClient: networkClient)
        
        var actualActivityDetails: ActivityDetails?
        
        sut.fetchActivityDetails { activityDetails in
            actualActivityDetails = activityDetails
        }
        
        XCTAssertNil(actualActivityDetails)
        XCTAssertEqual(networkClient.callCount, 1)
        XCTAssertEqual(networkClient.url, self.url)
    }
    
    func test_fetchActivityDetails_whenJsonDecoderFails_returnsNil() {
        let networkClient = NetworkClientSuccessStub(fileName: "ActivityDetailsInvalid")
        let sut = FinanceService(networkClient: networkClient)
        var actualActivityDetails: ActivityDetails?
        
        sut.fetchActivityDetails { activityDetails in
            actualActivityDetails = activityDetails
        }
        
        XCTAssertNil(actualActivityDetails)
        XCTAssertEqual(networkClient.callCount, 1)
        XCTAssertEqual(networkClient.url, self.url)
    }
}
