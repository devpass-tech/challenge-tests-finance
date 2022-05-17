//
//  ContactListTest.swift
//  FinanceAppTests
//
//  Created by Amaryllis Baldrez on 09/05/22.
//

import Foundation
import XCTest
@testable import FinanceApp

class ContactListTest: XCTestCase {
    
    private var networkClientProtocol: NetworkClientMock!
    private var sut: FinanceService!
    
    override func setUp() async throws {
        networkClientProtocol = NetworkClientMock()
        sut = FinanceService(networkClient: networkClientProtocol)
    }
    
    override func tearDown() {
        sut = nil
        networkClientProtocol = nil
    }
    
    func testFinanceServiceContactListMethod_WhenJSONDecoded_ShouldBeNotNil() {
        let expectations = expectation(description: "WhenJSONDecoded_NotNil")
        let contacts = [Contact(name: "Ronald Robertson", phone: "+55 (11) 99999-9999")]
        var result = Result<[Contact], Error>.success(contacts)
        
        sut.fetchContactList({ response in
            result = response
            expectations.fulfill()
        })
        
        waitForExpectations(timeout: 3.0)
        XCTAssertNotNil(result)
        
        switch result {
        case .success(let contact):
            XCTAssertNotNil(contact)
        default:
            XCTFail()
        }

}
    
    func testFinanceServiceContactListMethod_WhenJSONDontDecoded_ShouldBeDecodeError() {
        let expectations = expectation(description: "WhenJSONDecoded_ShouldBeNotNil")
        let error = HTTPClientError.decodeError
        var result = Result<[Contact], Error>.failure(error)
        
        sut.fetchContactList({ response in
            result = response
            expectations.fulfill()
        })
        
        waitForExpectations(timeout: 3.0)
        
        switch result {
        case .failure(let error):
            XCTAssertNotNil(error)
        default:
            XCTFail()
        }

}
}
