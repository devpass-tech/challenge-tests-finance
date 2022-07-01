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
            XCTAssertEqual(networkSpy.performRequestCount, 1)
            XCTAssertEqual(networkSpy.performRequestPassed, Constants.fetchHomeDataURLString)
        }
    }
    
    func testFetchHomeDataWhenDataIsNilshouldReturnNil() {
        networkSpy.dataToBeReturned = nil
        
        sut.fetchHomeData { response in
            XCTAssertNil(response)
        }
    }
    
    func testFetchHomeDataWhenDataIsNotNilWhenDecodeSucceedShouldReturnCorrectHomeData() {
        networkSpy.dataToBeReturned = Constants.defaultData
        
        sut.fetchHomeData { response in
            XCTAssertNil(response)
        }
    }
    
    func testFetchHomeDataWhenDataIsNotNilWhenDecodeErrorShouldReturnNilHomeData() {
        networkSpy.dataToBeReturned = Constants.defaultDataWithError
        
        sut.fetchHomeData { response in
            XCTAssertNil(response)
        }
    }
}

private extension FinanceServiceTests {
    enum Constants {
        static let defaultDataWithError = "".data(using: .utf8)
        
        static let fetchHomeDataURLString = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json"
        
        static let defaultData =
        """
        {
          balance: 15459.27,
          savings: 1000.0,
          spending: 500.0,
          activity: [
            {
              name: "Mall",
              price: 100.0,
              time: "8:57 AM",
            },
            {
              name": "Food Court",
              price": 100.0,
              time": "8:57 AM",
            },
            {
              name: "Oceanic Airlines",
              price: 100.0,
              time: "8:57 AM",
            },
            {
              name: "Gym Membership",
              price: 100.0,
              time: "8:57 AM",
            },
            {
              name: "Private Transport",
              price: 100.0,
              time: "8:57 AM",
            },
          ],
        }
        """.data(using: .utf8)
    }
}
