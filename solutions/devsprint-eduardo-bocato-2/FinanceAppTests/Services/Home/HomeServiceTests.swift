//
//  HomeServiceTests.swift
//  FinanceAppTests
//
//  Created by Gustavo Soares on 04/05/22.
//

import Foundation
import XCTest

@testable import FinanceApp

final class HomeServiceTests: XCTestCase {

    
    func test_homeService_whenFetchHomeData_shouldReturnHomeData() {

        // Given
        let sut: HomeServiceStub = .init()
        sut.homeDataToBeReturned = MockHomeData.homeData

        let expectation = expectation(description: #function)

        sut.fetchHomeData { homeData in
            XCTAssertEqual(homeData?.balance, 8001.00)
            XCTAssertEqual(homeData?.spending, 8000.00)
            XCTAssertEqual(homeData?.savings, 1.0)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
