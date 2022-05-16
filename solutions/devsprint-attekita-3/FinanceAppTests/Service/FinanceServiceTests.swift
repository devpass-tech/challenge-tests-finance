//
//  FinanceServiceTests.swift
//  FinanceAppTests
//
//  Created by Matheus Góes on 09/05/22.
//

import XCTest
@testable import FinanceApp

final class FinanceServiceTests: XCTestCase {
    
    private var sut: FinanceService!
    private var networkClientMock: NetworkClientMock!

    override func setUp() {
        networkClientMock = NetworkClientMock()
        sut = FinanceService(networkClient: networkClientMock)
    }

    override func tearDown() {
        sut = nil
        networkClientMock = nil
    }
    
    func testFinanceServiceFetchActivityDetailsMethod_WhenJSONDecoded_ShouldBeNotNil() {
        let expectations = self.expectation(description: "WhenJSONDecoded_ShouldBeNotNil")
        var result: ActivityDetails? = nil
        networkClientMock.expectedResponse = .success
        
        sut.fetchActivityDetails { response in
            result = response
            expectations.fulfill()
        }
        
        waitForExpectations(timeout: 3.0)

        XCTAssertNotNil(result, "fails because result is nil")
    }
    
    func testFinanceServiceFetchActivityDetailsMethod_WhenJSONDecoded_ShouldHaveCorrectInformations() {
        let expectations = self.expectation(description: "WhenJSONDecoded_ShouldHaveCorrectInformations")
        var result: ActivityDetails? = nil
        
        sut.fetchActivityDetails { response in
            result = response
            expectations.fulfill()
        }
        
        waitForExpectations(timeout: 3.0)
        
        XCTAssertEqual(result?.name, "Mall", "the received name property fails becuase is not equal to json payload.")
        XCTAssertEqual(result?.category, "Shopping", "the received category property fails becuase is not equal to json payload.")
        XCTAssertEqual(result?.price, 100.0, "the received price property fails becuase is not equal to json payload.")
        XCTAssertEqual(result?.time, "8:57 AM", "the received time property fails becuase is not equal to json payload.")
    }
    
    func testFinanceServiceTransferAmountMethod_WhenJSONDecoded_ShouldBeNotNil() {
        let expectations = self.expectation(description: "When JSON of TransferResult request is decoded it should be not nil")
        
        networkClientMock.expectedResponse = .success
        var result: TransferResult? = nil
        
        
        sut.transferAmount { response in
            result = response
            expectations.fulfill()
        }
        
        waitForExpectations(timeout: 3.0)
        
        XCTAssertNotNil(result, "test failed because the received TransferResult is nil" )
    }
    
    func testFinanceServiceTransferAmountMethod_WhenJSONDecoded_ShouldHaveCorrectInformations() {
        let expectations = self.expectation(description: "When JSON of TransferResult request is decoded it should be with the right info")
        
        networkClientMock.expectedResponse = .successWithCustomJson("transfer_amount_endpoint_false")
        var result: TransferResult? = nil
        
        
        sut.transferAmount { response in
            result = response
            expectations.fulfill()
        }
        
        waitForExpectations(timeout: 3.0)
        
        XCTAssertEqual(result?.success, false, "the received success property fails because is not equal to json payload")
    }
}
