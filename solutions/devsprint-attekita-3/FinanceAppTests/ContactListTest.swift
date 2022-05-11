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
    private let networkClientProtocol = NetworkClientProtocolStub()
    private let financeService = FinanceServiceProtocolStub()
    private lazy var sut = FinanceService(networkClient: networkClientProtocol)
    typealias ContactListResult = Result<[Contact]?, Error>
    
    func test_fetchContactList_givenValidData_andSessionReturningSuccess() {
        
        var result: ContactListResult?
        financeService.fetchContactList({
            result = $0
        })
        
        XCTAssertTrue(financeService.fetchDataCalled)
        
        switch result {
        case .success(let contact):
            XCTAssertEqual(contact?.first?.name, "Ronald Robertson")
            XCTAssertEqual(contact?.first?.phone, "+55 (11) 99999-9999")
        default:
            XCTFail("Result should be fetch without error")
        }
}

class FinanceServiceProtocolStub: FinanceServiceProtocol {
    
    private(set) var fetchDataCalled = false
    
    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) { }
    
    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void) { }
    
    func fetchContactList(_ completion: @escaping (Result<[Contact]?, Error>) -> Void) {
        fetchDataCalled = true
    }
    
    func transferAmount(_ completion: @escaping (TransferResult?) -> Void) { }
    
    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void) { }
    
}

class NetworkClientProtocolStub: NetworkClientProtocol {
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let newData = ContactListMocks.validData
        completion(newData)
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
            {
                "name": "Ronald Robertson",
                "phone": "+55 (11) 99999-9999"
            }
            """.data(using: .utf8)
        }()
}
}
