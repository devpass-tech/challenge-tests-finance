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

    func testFetchHomeDataShouldEqualsMockData() {
        let financeService = FinanceService(networkClient: networkClientFake)
        let homeDataFake = HomeData.fixture(balance: 15459.27,
                                            savings: 1000.0,
                                            spending: 500.0,
                                            activity: [Activity(name: "Mall",
                                                                price: 100.0,
                                                                time: "8:57 AM")])
        
        financeService.fetchHomeData { (homeData) in
            XCTAssertEqual(homeData, homeDataFake)
        }
    }
}
