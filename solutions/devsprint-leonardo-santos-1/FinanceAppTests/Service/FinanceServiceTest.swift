//
//  FinanceServiceTest.swift
//  FinanceAppTests
//
//  Created by Leonardo Cunha on 21/06/22.
//

import XCTest
@testable import FinanceApp

class FinanceServiceTest: XCTestCase {
    
    
    func test_whenFetchContactList_DecodeShouldMatchMockedData() throws {
        
        let url = try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/contact_list_endpoint.json"))
        let contactListMock = ContactListMock()
        let fakeFinanceService = FinanceService(networkClient: contactListMock)
        let mockedContactList = [Contact(name: "Ronald Robertson",
                                         phone: "+55 (11) 99999-9999"),
                                 Contact(name: "Johnny Watson",
                                         phone: "+55 (11) 99999-9999")]
        
        fakeFinanceService.fetchContactList { contactList in
            
            XCTAssertNotNil(contactList)
            XCTAssertEqual(contactList, mockedContactList)
        }
    }
}
