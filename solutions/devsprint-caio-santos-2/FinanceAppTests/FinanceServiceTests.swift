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

    func test_fetchHomeData_withData_shouldCallWithSuccess() {
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

    func test_fetchHomeData_withoutData_shouldCallWithError() {
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
  
    func test_transferAmount_WithValidJson_ShouldReturnParsedObject() {
        let sut = FinanceService(networkClient: NetworkClientTransferAmountMockSuccess())
        sut.transferAmount { result in
            XCTAssertNotNil(result)
            XCTAssertTrue(result?.success ?? false)
        }
    }
    
    func test_transferAmount_WithInvalidJson_ShouldReturnNil() {
        let sut = FinanceService(networkClient: NetworkClientTransferAmountMockError())
        sut.transferAmount { result in
            XCTAssertNil(result)
        }
    }

    func test_transferAmount_WithVilValue_ShouldReturnNil() {
        let sut = FinanceService(networkClient: NetworkClientTransferAmountMockNil())
        sut.transferAmount { result in
            XCTAssertNil(result)
        }
    }
}
