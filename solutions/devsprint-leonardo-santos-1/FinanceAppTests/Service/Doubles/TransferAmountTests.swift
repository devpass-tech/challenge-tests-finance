//
//  TransferAmountTests.swift
//  FinanceAppTests
//
//  Created by Gabriela Sillis on 24/06/22.
//

import XCTest
@testable import FinanceApp

final class TransferAmountTests: XCTestCase {
    private let networkClientSpy = NetworkClientSpy()
    private lazy var sut = FinanceService(networkClient: networkClientSpy)
    
    func testTransferAmount_ShouldCallPerformRequestOnceWithCorrectUrl() {
        sut.transferAmount { _ in }
        XCTAssertEqual(networkClientSpy.performRequestCallCount, 1)
        XCTAssertTrue(networkClientSpy.performRequestCalled)
        XCTAssertEqual(networkClientSpy.performRequestPassed?.description, url)
    }
    
    func testTransferAmount_ShouldReturnNil_IfNoDataIsPassed() {
        var data: TransferResult?
        networkClientSpy.dataToBeReturned = nil
        sut.transferAmount { data = $0 }
        XCTAssertNil(data)
    }
    
    func testTransferAmount_ShouldReturnCorrectData() {
        var data: TransferResult?
        networkClientSpy.dataToBeReturned = defaultData
        sut.transferAmount { data = $0 }
        XCTAssertEqual(data?.success, true)
        XCTAssertNotNil(data)
    }
    
    func testTransferAmount_ShouldReturnNil_IfAInvalidJsonIsPassed() {
        var data: TransferResult?
        networkClientSpy.dataToBeReturned = defaultError
        sut.transferAmount { data = $0 }
        XCTAssertNil(data)
    }
}

private extension TransferAmountTests {
    var defaultData : Data? {
        """
        {
            "success": true
        }
        """.data(using: .utf8)
    }
    
    var defaultError: Data? {
        """
        {
        }
        """.data(using: .utf8)
    }
    
    var url: String {
        return "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/transfer_successful_endpoint.json"
    }
}
