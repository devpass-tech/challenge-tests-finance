//
//  HomeServiceTests.swift
//  FinanceAppTests
//
//  Created by Gustavo Soares on 05/05/22.
//

import Foundation
import XCTest

@testable import FinanceApp

final class HomeServiceTests: XCTestCase {
    func test_homeService_whenFetchHomeData_shouldReturnHomeData() {
        // Given
        let sut = HomeServiceStub.self
        sut.homeDataToBeReturned = MockHomeData.homeData

        let expectation = expectation(description: "Expected return HomeData")

        // When / Then
        sut.fetchHomeData { homeData in
            XCTAssertEqual(homeData?.balance, 8001.00)
            XCTAssertEqual(homeData?.spending, 8000.00)
            XCTAssertEqual(homeData?.savings, 1.0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
