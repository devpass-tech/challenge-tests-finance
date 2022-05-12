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
    
    private var networkClientProtocol: NetworkClientProtocolStub!
    private var financeService:FinanceService!
    private lazy var sut = FinanceService(networkClient: networkClientProtocol)
    
    override func setUp() async throws {
        networkClientProtocol = NetworkClientProtocolStub()
        financeService = FinanceService(networkClient: networkClientProtocol)
    }
    
    func test_fetchContactList_givenValidData_andSessionReturningSuccess() {
        
        networkClientProtocol.completionHandlerToBeReturned = ContactListMocks.validData
        let expectations = expectation(description: "Loading contact list")
        var result: Result<[Contact], Error>?
        
        financeService.fetchContactList({ response in
            result = response
            expectations.fulfill()
        })
        
        XCTAssertNotNil(result)
        self.waitForExpectations(timeout: 3.0)
        
        switch result {
        case .success(let contact):
            XCTAssertNotNil(contact)
        default:
            XCTFail()
        }

}

class FinanceServiceProtocolStub: FinanceServiceProtocol {
    
    private(set) var fetchDataCalled = false
    
    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) { }
    
    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void) { }
    
    func fetchContactList(_ completion: @escaping (Result<[Contact], Error>) -> Void) {
        fetchDataCalled = true
    }
    
    func transferAmount(_ completion: @escaping (TransferResult?) -> Void) { }
    
    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void) { }
    
}

class NetworkClientProtocolStub: NetworkClientProtocol {
    var completionHandlerToBeReturned: (Data?)?
    private(set) var fetchDataUrlPassed: URL?
    
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        do {
            let newData = ContactListMocks.validData
            completion(newData)
        } catch {
            completion(nil)
        }
    }
}

class ContactListMocks {
    
    static var validURL = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/contact_list_endpoint.json")
    
    struct DecodableFake: Decodable {
        let name: String?
        let phone: String?
    }
    
    static var validData: Data? = {
             """
            {[
                "name": "Ronald Robertson",
                "phone": "+55 (11) 99999-9999"
            ]}
            """.data(using: .utf8)
        }()
}
}
