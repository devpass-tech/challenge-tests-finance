//
//  FinanceServiceTest.swift
//  FinanceAppTests
//
//  Created by Leonardo Cunha on 21/06/22.
//

import XCTest
@testable import FinanceApp

final class FinanceServiceTests: XCTestCase {
    private let networkSpy = NetworkClientSpy()
    private lazy var sut = FinanceService(networkClient: networkSpy)
    
    // MARK: fetchContactList
    func test_fetchContactList_whenDecondeIsSuccessful_objectShouldMatchMockedContactList() {
        networkSpy.dataToBeReturned = contactListData
        let mockedContactList = [Contact.fixture(name: "Ronald Robertson",
                                                 phone: "+55 (11) 99999-9999"),
                                 Contact.fixture(name: "Johnny Watson",
                                                 phone: "+55 (11) 99999-9999")]
        
        sut.fetchContactList { contactList in
            
            XCTAssertEqual(contactList, mockedContactList)
        }
    }
    
    func test_fetchContactList_whenIncomingDataIsNil_shouldReturnNilOnCompletion() {
        networkSpy.dataToBeReturned = nil
        sut.fetchContactList { contactList in
            
            XCTAssertNil(contactList)
        }
    }
    
    func test_fetchContactList_givenUrl_shouldPassCorrectURLToPerformRequest() {
        sut.fetchContactList { _ in }
        let passedUrlString = networkSpy.performRequestPassed
        
        XCTAssertEqual(passedUrlString, fetchContactListUrlString)
    }
    
    func test_fetchContactList_whenIncomingDataIsNotNil_whenDecodeFails_shouldReturnNilOnCompletion() {
        networkSpy.dataToBeReturned = dataWithError
        sut.fetchContactList { contactList in
            
            XCTAssertNil(contactList)
        }
    }
    
    // MARK: Private properties
    private let contactListData =  {
"""
[
{
    "name": "Ronald Robertson",
    "phone": "+55 (11) 99999-9999"
},
{
    "name": "Johnny Watson",
    "phone": "+55 (11) 99999-9999"
}
]
""".data(using: .utf8)
    }()
    
    private let dataWithError = "".data(using: .utf8)
    
    private let fetchContactListUrlString = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/contact_list_endpoint.json"
}
