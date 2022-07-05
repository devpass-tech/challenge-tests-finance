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
        let passedUrlString = networkSpy.performRequestPassed?.description
        
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
            XCTAssertEqual(networkSpy.performRequestCallCount, 1)
            XCTAssertEqual(networkSpy.performRequestPassed?.description, self.fetchHomeDataURLString)
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
    
    // MARK: - fetchUserProfile
    
    func test_fetchUserProfile_givenUrl_shouldCallNetworkClientToPerformRequest() {
        //given

        //when
        sut.fetchUserProfile { _ in

            //then
            XCTAssertEqual(self.networkSpy.performRequestCallCount, 1)
        }
    }

    func test_fetchUserProfile_whenDataIsNil_shouldCallCompletionNil() {

        //given
        networkSpy.dataToBeReturned = nil

        //when
        sut.fetchUserProfile { data in

            //then
            XCTAssertEqual(nil, data)
        }
    }

    func test_fetchUserProfile_whenDataIsInvalid_shouldCallCompletionNil() {

        //given
        let invalidData = Data("invalid string".utf8)
        networkSpy.dataToBeReturned = invalidData

        //when
        sut.fetchUserProfile { data in

            //then
            XCTAssertEqual(nil, data)
        }

    }

    func test_fetchUserProfile_whenDataIsValid_shouldCallCompletionWithModel() {
        //given
        networkSpy.dataToBeReturned = fetchUserProfileData
        
        let userProfile = UserProfile(
            name: "Emanuel",
            phone: "2352352",
            email: "2352352",
            address: "rua 1233",
            account: Account(agency: "agencia 123", account: "gaifea")
        )

        //when
        sut.fetchUserProfile { data in

            //then
            XCTAssertEqual(userProfile, data)
        }
    }

    func test_fetchUserProfile_givenURL_shouldPassCorrectURL() {
        //given
        let url = URL(string: fetchUserProfileUrlString)

        //when
        sut.fetchUserProfile { _ in

            //then
            XCTAssertEqual(self.networkSpy.performRequestPassed, url)
        }
    }
    
    // MARK: Private properties
    
    private let dataWithError = "".data(using: .utf8)
    private let fetchContactListUrlString = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/contact_list_endpoint.json"
    private let fetchHomeDataURLString = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json"
    private let fetchUserProfileUrlString = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/user_profile_endpoint.json"
    
    private let fetchUserProfileData = """
        {
            "name": "Emanuel",
            "phone": "2352352",
            "email": "2352352",
            "address": "rua 1233",
            "account": {
                "agency": "agencia 123",
                "account": "gaifea"
            }
        }
    """.data(using: .utf8)
    
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
