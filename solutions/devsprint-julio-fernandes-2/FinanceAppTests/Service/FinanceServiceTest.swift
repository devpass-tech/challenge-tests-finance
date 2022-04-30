//
//  FinanceServiceTest.swift
//  FinanceAppTests
//
//  Created by Tatiana Rico on 25/04/22.
//

import XCTest
@testable import FinanceApp

class FinanceServiceTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_Transfer_Amount_ReturnNil() {
        var resultExpected: TransferResult?
        let sut = FinanceService(networkClient: NetworkClientTransferAmountMockError())
        sut.transferAmount { result in
            guard let result = result else { return }
            resultExpected = result
        }
        XCTAssertNil(resultExpected)
    }
    
    func test_Transfer_Amount_Sucess_Return() {
        let sut = FinanceService(networkClient: NetworkClientTransferAmountMockSuccess())
        
        sut.transferAmount { result in
            XCTAssertNotNil(result)
            XCTAssertTrue(result?.success ?? false)
        }
    }
    
}

final class FinanceService2Tests: XCTestCase {
    
    private let networkClient = NetworkClientProtocolSpy()
    var sut: FinanceService?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = FinanceService(networkClient: networkClient)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_fetchHomeData() {
        sut?.fetchHomeData { _ in }
        XCTAssertTrue(networkClient.performRequestCalled)
        XCTAssertEqual(networkClient.performRequestToBeReturnedURL, "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json")
    }
    
    func test_fetchHomeData_returned_success() {
        sut = FinanceService(networkClient: NetworkClientHomeDataMockSuccess())
        sut?.fetchHomeData{ data in
            XCTAssertNotNil(data)
        }
    }
    
    func test_fetchHomeData_returned_error() {
        sut = FinanceService(networkClient: NetworkClientHomeDataMockError())
        sut?.fetchHomeData{ data in
            XCTAssertNil(data)
        }
    }
    
    func test_fetchActivityDetails() {
        sut?.fetchActivityDetails { _ in }
        XCTAssertTrue(networkClient.performRequestCalled)
        XCTAssertEqual(networkClient.performRequestToBeReturnedURL, "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/activity_details_endpoint.json")
    }
    
    func test_fetchActivityDetails_returned_success() {
        sut = FinanceService(networkClient: NetworkClientActivityDetailsMockSuccess())
        sut?.fetchActivityDetails{ data in
            XCTAssertNotNil(data)
        }
    }
    
    func test_fetchActivityDetails_returned_error() {
        sut = FinanceService(networkClient: NetworkClientActivityDetailsMockError())
        sut?.fetchActivityDetails{ data in
            XCTAssertNil(data)
        }
    }
    
    func test_fetchContactList() {
        sut?.fetchContactList { _ in }
        XCTAssertTrue(networkClient.performRequestCalled)
        XCTAssertEqual(networkClient.performRequestToBeReturnedURL, "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/contact_list_endpoint.json")
    }
    
    func test_fetchContactList_returned_success() {
        sut = FinanceService(networkClient: NetworkClientContactListMockSuccess())
        sut?.fetchContactList{ data in
            XCTAssertNotNil(data)
        }
    }
    
    func test_fetchContactList_returned_error() {
        sut = FinanceService(networkClient: NetworkClientContactListMockError())
        sut?.fetchContactList{ data in
            XCTAssertNil(data)
        }
    }
    
    func test_transferAmount() {
        sut?.transferAmount { _ in }
        XCTAssertTrue(networkClient.performRequestCalled)
        XCTAssertEqual(networkClient.performRequestToBeReturnedURL, "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/transfer_successful_endpoint.json")
    }
    
    func test_fetchUserProfile() {
        sut?.fetchUserProfile { _ in }
        XCTAssertTrue(networkClient.performRequestCalled)
        XCTAssertEqual(networkClient.performRequestToBeReturnedURL, "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/user_profile_endpoint.json")
    }
    
    func test_fetchUserProfile_returned_success() {
        sut = FinanceService(networkClient: NetworkClientUserProfileMockSuccess())
        sut?.fetchUserProfile{ data in
            XCTAssertNotNil(data)
        }
    }
    
    func test_fetchUserProfile_returned_error() {
        sut = FinanceService(networkClient: NetworkClientUserProfileMockError())
        sut?.fetchUserProfile{ data in
            XCTAssertNil(data)
        }
    }
}

final class NetworkClientProtocolSpy: NetworkClientProtocol {
    
    var completionData: Data?
    private(set) var performRequestCalled = false
    private(set) var performRequestToBeReturnedURL: String?
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        performRequestToBeReturnedURL = url.absoluteString
        performRequestCalled = true
        completion(completionData)
    }
}
