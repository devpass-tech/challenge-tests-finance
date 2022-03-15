//
//  FinanceServiceTests.swift
//  FinanceAppTests
//
//  Created by Murillo R. Araújo on 15/03/22.
//

import XCTest
@testable import FinanceApp

class FinanceServiceTests: XCTestCase {

    var sut: FinanceServiceMock!

    override func setUp() {
        sut = FinanceServiceMock()
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_fetchHomeData_ShoudCallWithSuccess() {
        sut.errorAPI = nil
        var resultExpected: HomeData?

        sut.fetchHomeData { homeData in

            guard let result = homeData else {
                return
            }

            resultExpected = result
        }

        XCTAssertNotNil(resultExpected)
        XCTAssertEqual(resultExpected?.balance, 15459.27)
        XCTAssertEqual(resultExpected?.savings, 1000.0)
        XCTAssertEqual(resultExpected?.spending, 500)
    }

    func test_fetchHomeData_ShoudCallWithError() {
        sut.errorAPI = .noData
        var resultExpected: HomeData?

        sut.fetchHomeData { homeData in

            guard let result = homeData else {
                return
            }

            resultExpected = result
        }

        XCTAssertNil(resultExpected)
    }
}
