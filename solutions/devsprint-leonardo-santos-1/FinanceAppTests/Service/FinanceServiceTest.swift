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
    
    // MARK: - fetchHomeData
    
    func testFetchHomeDataGivenURLShoulCallNetworkClientWithCorrectURL() {
        sut.fetchHomeData { [networkSpy] _ in
            XCTAssertTrue(networkSpy.performRequestCalled)
            XCTAssertEqual(networkSpy.performRequestCount, 1)
            XCTAssertEqual(networkSpy.performRequestPassed, self.fetchHomeDataURLString)
        }
    }
    
    func testFetchHomeDataWhenDataIsNilshouldReturnNil() {
        networkSpy.dataToBeReturned = nil
        
        sut.fetchHomeData { response in
            XCTAssertNil(response)
        }
    }
    
    func testFetchHomeDataWhenDataIsNotNilWhenDecodeSucceedShouldReturnCorrectHomeData() {
        networkSpy.dataToBeReturned = fetchHomeData
        
        sut.fetchHomeData { response in
            XCTAssertNil(response)
        }
    }
    
    func testFetchHomeDataWhenDataIsNotNilWhenDecodeErrorShouldReturnNilHomeData() {
        networkSpy.dataToBeReturned = dataWithError
        
        sut.fetchHomeData { response in
            XCTAssertNil(response)
        }
    }
    
    // MARK: Private properties
    
    private let dataWithError = "".data(using: .utf8)
    private let fetchContactListUrlString = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/contact_list_endpoint.json"
    private let fetchHomeDataURLString = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json"
    
    private let contactListData =
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
    
    private let fetchHomeData =
        """
        {
          balance: 15459.27,
          savings: 1000.0,
          spending: 500.0,
          activity: [
            {
              name: "Mall",
              price: 100.0,
              time: "8:57 AM",
            },
            {
              name": "Food Court",
              price": 100.0,
              time": "8:57 AM",
            },
            {
              name: "Oceanic Airlines",
              price: 100.0,
              time: "8:57 AM",
            },
            {
              name: "Gym Membership",
              price: 100.0,
              time: "8:57 AM",
            },
            {
              name: "Private Transport",
              price: 100.0,
              time: "8:57 AM",
            },
          ],
        }
        """.data(using: .utf8)
}
