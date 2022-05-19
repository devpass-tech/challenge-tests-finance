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
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        networkClientProtocol = nil
    }
    
    func testFinanceServiceContactListMethod_WhenJSONDecoded_ShouldBeNotNil() {
        networkClientProtocol = NetworkClientMock()
        sut = FinanceService(networkClient: networkClientProtocol)
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
        let responseError = NetworkClientMock.Response.error(.noData)
        let networkClientProtocolWithError = NetworkClientMock()
        networkClientProtocolWithError.expectedResponse = responseError
        sut = FinanceService(networkClient: networkClientProtocolWithError)
        var result = Result<[Contact], Error>.failure(error)
        
        sut.fetchContactList({ response in
            result = response
            expectations.fulfill()
        })
        
        waitForExpectations(timeout: 3.0)
        
        switch result {
        case .failure(let error):
            XCTAssertNotNil(error)
            XCTAssertEqual(error as! HTTPClientError, HTTPClientError.decodeError)
        default:
            XCTFail()
        }
    }
    
    func test_WhenJSONDecode_ShouldHaveReturnCorrectInformations() {
        networkClientProtocol = NetworkClientMock()
        sut = FinanceService(networkClient: networkClientProtocol)
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
            XCTAssertEqual(try? result.get().first?.name, "Ronald Robertson")
            XCTAssertEqual(try? result.get().first?.phone, "+55 (11) 99999-9999")
        default:
            XCTFail()
        }
    }
}
