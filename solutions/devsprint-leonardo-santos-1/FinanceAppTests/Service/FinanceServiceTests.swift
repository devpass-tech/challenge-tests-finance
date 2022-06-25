//
//  FinanceServiceTests.swift
//  FinanceAppTests
//
//  Created by Junior Margalho on 22/06/22.
//

import XCTest

@testable import FinanceApp

final class FinanceServiceTests: XCTestCase {
    private let networkSpy = NetworkClientSpy()
    private lazy var sut = FinanceService(networkClient: networkSpy)

    func testFetchHomeDataGivenURLShoulCallNetworkClientWithCorrectURL() {
        sut.fetchHomeData { [networkSpy] _ in
            XCTAssertTrue(networkSpy.performRequestCalled)
            XCTAssertEqual(networkSpy.performRequestCallCount, 1)
            XCTAssertEqual(networkSpy.performRequestUrlPassed?.absoluteString, Constants.fetchHomeDataURLString)
        }
    }
}

private extension FinanceServiceTests {
    enum Constants {
        static let fetchHomeDataURLString = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json"
    }
}
