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
    
    var spy: UserProfile?
    var userProfileObject: UserProfile?
    
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
        
        sut.fetchUserProfile { userProfile in
            self.spy = userProfile
        }
        
        let unwrappedSpy = try XCTUnwrap(spy)
        
        XCTAssertEqual(unwrappedSpy, userProfileObject)
    }
    
    func test_ShouldReturnNil_WhenDataIsInvalid() throws {
        let networkStub = NetworkClientFailureStub()
        let sut = FinanceService(networkClient: networkStub)
        
        sut.fetchUserProfile { userProfile in
            self.spy = userProfile
        }
        
        XCTAssertNil(spy)
    }
    
    func test_ShouldReturnError_WhenJsonIsInvalid() throws {
        let networkStub = NetworkClientSuccessStub(fileName: "user-profile-invalid-json")
        let sut = FinanceService(networkClient: networkStub)
        
        sut.fetchUserProfile { userProfile in
            self.spy = userProfile
        }
        
        XCTAssertNil(spy)
    }
}
