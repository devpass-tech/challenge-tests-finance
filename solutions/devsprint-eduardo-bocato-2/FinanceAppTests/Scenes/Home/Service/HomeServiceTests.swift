//
//  HomeServiceTests.swift
//  FinanceAppTests
//
//  Created by Gustavo Soares on 05/05/22.
//

import Foundation
import XCTest
import SnapshotTesting

@testable import FinanceApp

final class HomeServiceTests: XCTestCase {
    func test_homeService_whenFetchHomeData_shouldReturnHomeData() {
        // Given
        let sut = HomeServiceStub.self
        sut.homeDataToBeReturned = MockHomeData.homeData

        let expectation = expectation(description: "Expected return HomeData")

        // When / Then
        sut.fetchHomeData { homeData in

            assertSnapshot(
                matching: homeData,
                as: .dump)

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
