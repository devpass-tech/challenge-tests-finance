//
//  FinanceServiceTests.swift
//  FinanceAppTests
//
//  Created by Raline Maria da Silva on 19/08/22.
//

import XCTest
@testable import FinanceApp

final class FinanceServiceTests: XCTestCase {
    
    private let networkClient = NetworkClientMock()
    private lazy var mock = FinanceService(networkClient: networkClient)
    var contact: [Contact]?
    private let dataWithError = "".data(using: .utf8)
    var passedURL: URL?
    
    var out: UserProfile?
    var userProfileObject: UserProfile?
    var url: URL?
    var callCount = 0
       
    override func setUp() {
        passedURL = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/contact_list_endpoint.json")!
        
        userProfileObject = UserProfile(name: "Irma Flores",
                                        phone: "+55 (11) 99999-9999",
                                        email: "irma@devpass.com.br",
                                        address: "Rua Bela Cintra, 495",
                                        account: Account(agency: "0001", account: "123456-7"))
        
        url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/user_profile_endpoint.json")!
    }
    
    override func tearDown() {
        self.passedURL = nil
        
        self.out = nil
        self.callCount = 0
        self.userProfileObject = nil
        self.url = nil
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
 
    func test_FetchUserProfile_WhenIsCalledWithSuccess_ShouldReturnUserProfileData() throws {
        let (sut, networkStub) = makeSUT(fileName: "user-profile", url: url, isRequestSuccess: true)

        sut.fetchUserProfile { userProfile in
            self.out = userProfile
        }

        let unwrappedOut = try XCTUnwrap(out)

        XCTAssertEqual(unwrappedOut, userProfileObject)
        XCTAssertEqual(networkStub.performRequestCount, 1)
        XCTAssertEqual(networkStub.url, url)
    }

    func test_FetchUserProfile_WhenIsCalledWithInvalidData_ShouldReturnNil() throws {
        let (sut, networkStub) = makeSUT(fileName: "", url: url, isRequestSuccess: false)

        sut.fetchUserProfile { userProfile in
            self.out = userProfile
        }

        XCTAssertNil(out)
        XCTAssertEqual(networkStub.performRequestCount, 1)
        XCTAssertEqual(networkStub.url, url)
    }

    func test_FetchUserProfile_WhenIsCalledWithInvalidJSON_ShouldReturnNil() throws {
        let (sut, networkStub) = makeSUT(fileName: "user-profile-invalid", url: url, isRequestSuccess: true)

        sut.fetchUserProfile { userProfile in
            self.out = userProfile
        }

        XCTAssertNil(out)
        XCTAssertEqual(networkStub.performRequestCount, 1)
        XCTAssertEqual(networkStub.url, url)
    }
    
    func test_FetchActivityDetails_succeeds_whenJSONIsValid() {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/activity_details_endpoint.json")!
        let expectedActivityDetails = ActivityDetails(name: "Marvel", price: 10.00, category: "Movie", time: "21:00")
        let networkClient = NetworkClientStub(fileName: "ActivityDetails", isRequestSuccess: true)
        let sut = FinanceService(networkClient: networkClient)
        
        var actualActivityDetails: ActivityDetails?
        
        sut.fetchActivityDetails { activityDetails in
            actualActivityDetails = activityDetails
        }
        
        XCTAssertEqual(actualActivityDetails, expectedActivityDetails)
        XCTAssertEqual(networkClient.performRequestCount, 1)
        XCTAssertEqual(networkClient.url, url)
    }
    
    func test_fetchActivityDetails_whenNetworkingReturnsNilData_returnsNil() {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/activity_details_endpoint.json")!
        let networkClient = NetworkClientStub(fileName: "", isRequestSuccess: false)
        let sut = FinanceService(networkClient: networkClient)
        
        var actualActivityDetails: ActivityDetails?
        
        sut.fetchActivityDetails { activityDetails in
            actualActivityDetails = activityDetails
        }
        
        XCTAssertNil(actualActivityDetails)
        XCTAssertEqual(networkClient.performRequestCount, 1)
        XCTAssertEqual(networkClient.url, url)
    }
    
    func test_fetchActivityDetails_whenJsonDecoderFails_returnsNil() {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/activity_details_endpoint.json")!
        let networkClient = NetworkClientStub(fileName: "ActivityDetailsInvalid", isRequestSuccess: false)
        let sut = FinanceService(networkClient: networkClient)
        var actualActivityDetails: ActivityDetails?
        
        sut.fetchActivityDetails { activityDetails in
            actualActivityDetails = activityDetails
        }
        
        XCTAssertNil(actualActivityDetails)
        XCTAssertEqual(networkClient.performRequestCount, 1)
        XCTAssertEqual(networkClient.url, url)
    }
}

extension FinanceServiceTests {
    private func makeSUT(fileName: String, url: URL?, isRequestSuccess: Bool) -> (FinanceService, NetworkClientStub) {
        let networkStub = NetworkClientStub(fileName: fileName, url: url, isRequestSuccess: isRequestSuccess)
        let sut = FinanceService(networkClient: networkStub)
        return (sut, networkStub)
    }
}
