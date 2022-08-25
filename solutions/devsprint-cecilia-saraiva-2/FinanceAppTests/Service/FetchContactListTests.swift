//
//  FinanceServiceTests.swift
//  FinanceAppTests
//
//  Created by Raline Maria da Silva on 19/08/22.
//

import XCTest
@testable import FinanceApp

final class FinanceServiceFetchContactListTests: XCTestCase {
    
    private let networkClient = NetworkClientMock()
    private lazy var mock = FinanceService(networkClient: networkClient)
    var contact: [Contact]?
    private let dataWithError = "".data(using: .utf8)
    var passedURL: URL?
       
    override func setUp() {
        passedURL = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/contact_list_endpoint.json")!
    }
    
    override func tearDown() {
        self.passedURL = nil
    }

    func testFetchContactListSucessWhenJSONIsValid() {
        networkClient.data = networkClient.contactListData
        let mockContactList = [Contact.list(name: "Ana",
                                            phone: "+55 (81) 99999-9999"),
                               Contact.list(name: "Maria",
                                            phone: "+55 (81) 11111-1111")]
        mock.fetchContactList { contactList in
            self.contact = contactList
        }
        
        XCTAssertEqual(contact, mockContactList)
        XCTAssertEqual(networkClient.perfomRequestCallCount, 1)
        XCTAssertEqual(networkClient.url, passedURL)
        
    }
    
    func testFetchContactListWhenIncomingDataWithReturnNill() {
        networkClient.data = nil
       
        mock.fetchContactList { contactList in
            self.contact = contactList
        }
        
        XCTAssertNil(contact)
    }
    
    func testFetchContactListWhenJSONDecodeFailsReturnNil() {
        networkClient.data = dataWithError
        
        mock.fetchContactList { contactList in
            self.contact = contactList
        }
        
        XCTAssertNil(contact)
    }
 
}
