//
//  FinanceServiceTests.swift
//  FinanceAppTests
//
//  Created by Matheus Góes on 09/05/22.
//

import XCTest
@testable import FinanceApp

final class FinanceServiceTests: XCTestCase {
    
    private var sut: FinanceService!
    private var networkClientMock: NetworkClientMock!

    override func setUp() {
        networkClientMock = NetworkClientMock()
        sut = FinanceService(networkClient: networkClientMock)
    }

    override func tearDown() {
        sut = nil
        networkClientMock = nil
    }
    
    func testFinanceServiceFetchActivityDetailsMethod_WhenJSONDecoded_ShouldBeNotNil() {
        let expectations = self.expectation(description: "WhenJSONDecoded_ShouldBeNotNil")
        var result: ActivityDetails? = nil
        
        sut.fetchActivityDetails { response in
            result = response
            expectations.fulfill()
        }
        
        waitForExpectations(timeout: 3.0)

        XCTAssertNotNil(result, "fails because result is nil")
    }
    
    func testFinanceServiceFetchActivityDetailsMethod_WhenJSONDecoded_ShouldHaveCorrectInformations() {
        let expectations = self.expectation(description: "WhenJSONDecoded_ShouldHaveCorrectInformations")
        var result: ActivityDetails? = nil
        
        sut.fetchActivityDetails { response in
            result = response
            expectations.fulfill()
        }
        
        waitForExpectations(timeout: 3.0)
        
        XCTAssertEqual(result?.name, "Mall", "the received name property fails becuase is not equal to json payload.")
        XCTAssertEqual(result?.category, "Shopping", "the received category property fails becuase is not equal to json payload.")
        XCTAssertEqual(result?.price, 100.0, "the received price property fails becuase is not equal to json payload.")
        XCTAssertEqual(result?.time, "8:57 AM", "the received time property fails becuase is not equal to json payload.")
    }

    func testFetchHomeDataMethod_WhenJSONDecoded_ShouldBeNotNil() {
        // Given
        let expectations = self.expectation(description: "WhenJSONDecoded_ShouldBeNotNil")
        var result: HomeData? = nil

        // When
        sut.fetchHomeData { response in
            result = response
            expectations.fulfill()
        }

        // Then
        waitForExpectations(timeout: 3.0)

        XCTAssertNotNil(result, "fails because result is nil")
    }

    func testFetchHomeDataMethod_WhenJSONDecoded_ShouldHaveCorrectInformations() {
        // Given
        let expectations = self.expectation(description: "WhenJSONDecoded_ShouldHaveCorrectInformations")
        var result: HomeData? = nil

        // When
        sut.fetchHomeData { response in
            result = response
            expectations.fulfill()
        }

        // Then
        waitForExpectations(timeout: 3.0)

        XCTAssertEqual(result?.balance, 15459.27)
        XCTAssertEqual(result?.savings, 1000.0)
        XCTAssertEqual(result?.spending, 500.0)
        XCTAssertEqual(result?.activity[0].name, "Mall")
        XCTAssertEqual(result?.activity[0].price, 100.0)
        XCTAssertEqual(result?.activity[0].time, "8:57 AM")
    }
}
