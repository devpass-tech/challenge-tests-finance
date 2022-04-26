//
//  FinanceServiceTest.swift
//  FinanceAppTests
//
//  Created by Tatiana Rico on 25/04/22.
//

import XCTest
@testable import FinanceApp

class FinanceServiceTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_Transfer_Amount_ReturnNil() {
        var resultExpected: TransferResult?
        let sut = FinanceService(networkClient: NetworkClientTransferAmountMockError())
        sut.transferAmount { result in
            guard let result = result else { return }
            resultExpected = result
        }
        XCTAssertNil(resultExpected)
    }
    
    func test_Transfer_Amount_Sucess_Return() {
        let sut = FinanceService(networkClient: NetworkClientTransferAmountMockSuccess())
        
        sut.transferAmount { result in
            XCTAssertNotNil(result)
            XCTAssertTrue(result?.success ?? false)
        }
    }
    
}
