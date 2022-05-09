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

        let expectation = expectation(description: #function)

        sut.fetchHomeData { homeData in
            XCTAssertEqual(homeData?.balance, MockHomeData.homeData?.balance)
            XCTAssertEqual(homeData?.spending, MockHomeData.homeData?.spending)
            XCTAssertEqual(homeData?.savings, MockHomeData.homeData?.savings)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}

final class MockHomeData {
    static var homeData: HomeData? {
        if let fileURL = Bundle(for: self)
            .url(forResource: "homedatamock",
                 withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                return try JSONDecoder()
                    .decode(HomeData.self, from: data)
            } catch {
                return nil
            }
        }
        return nil
    }
}
