//
//  FinanceServiceTests.swift
//  FinanceAppTests
//
//  Created by Henrique Augusto on 16/08/22.
//

import Foundation
import XCTest

@testable import FinanceApp

final class FinanceServiceTests: XCTestCase {
    
    var userProfileObject: UserProfile?
    var userProfileSpy: UserProfile?
    var userProfileErrorSpy: ApiError?
    
    override func setUp() {
        userProfileObject = UserProfile(name: "Irma Flores",
                                        phone: "+55 (11) 99999-9999",
                                        email: "irma@devpass.com.br",
                                        address: "Rua Bela Cintra, 495",
                                        account: Account(agency: "0001", account: "123456-7"))
    }
    
    func test_ShouldReturnUserProfileData() throws {
        let networkStub = NetworkClientSuccessStub(fileName: "user-profile")
        let sut = FinanceService(networkClient: networkStub)
        
        sut.fetchUserProfile { response, error in
            self.userProfileSpy = response
            self.userProfileErrorSpy = error
        }
        
        let unwrappedSpy = try XCTUnwrap(userProfileSpy)
        
        XCTAssertEqual(unwrappedSpy, userProfileObject)
        XCTAssertNil(userProfileErrorSpy)
    }
    
    func test_ShouldReturnNil_WhenDataIsInvalid() throws {
        let networkStub = NetworkClientFailureStub()
        let sut = FinanceService(networkClient: networkStub)
        
        sut.fetchUserProfile { response, error in
            self.userProfileSpy = response
            self.userProfileErrorSpy = error
        }
        
        let unwrappedError = try XCTUnwrap(userProfileErrorSpy)
        
        XCTAssertNil(self.userProfileSpy)
        XCTAssertEqual(unwrappedError, .invalidData)
    }
    
    func test_ShouldReturnError_WhenJsonIsInvalid() throws {
        let networkStub = NetworkClientSuccessStub(fileName: "user-profile-invalid-json")
        let sut = FinanceService(networkClient: networkStub)
        
        sut.fetchUserProfile { response, error in
            self.userProfileSpy = response
            self.userProfileErrorSpy = error
        }
        
        let unwrappedError = try XCTUnwrap(userProfileErrorSpy)
        
        XCTAssertNil(self.userProfileSpy)
        XCTAssertEqual(unwrappedError, .parseJson)
    }
}
