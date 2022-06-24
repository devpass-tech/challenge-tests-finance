//
//  FinanceServiceTests.swift
//  FinanceAppTests
//
//  Created by Junior Margalho on 22/06/22.
//

@testable import FinanceApp
import XCTest

final class FinanceServiceTests: XCTestCase {
    let networkClientFake = NetworkClientFake()
    lazy var sut = FinanceService(networkClient: networkClientFake)

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
