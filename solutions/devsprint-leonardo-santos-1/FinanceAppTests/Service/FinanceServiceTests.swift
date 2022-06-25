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

    func testFetchHomeDataShouldEqualsMockData() {
        let homeDataFake = HomeData.fixture(balance: 15459.27,
                                            savings: 1000.0,
                                            spending: 500.0,
                                            activity: [Activity(name: "Mall",
                                                                price: 100.0,
                                                                time: "8:57 AM")])
        sut.fetchHomeData { (homeData) in
            XCTAssertEqual(homeData, homeDataFake)
        }
    }
}
