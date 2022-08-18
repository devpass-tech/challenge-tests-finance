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
    var url: URL?
    var callCount = 0

    override func setUp() {
        userProfileObject = UserProfile(name: "Irma Flores",
                                        phone: "+55 (11) 99999-9999",
                                        email: "irma@devpass.com.br",
                                        address: "Rua Bela Cintra, 495",
                                        account: Account(agency: "0001", account: "123456-7"))
    }
    
    override func tearDown() {
        self.spy = nil
        self.callCount = 0
        self.url = nil
    }

    func test_ShouldReturnUserProfileData() throws {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/user_profile_endpoint.json")!
        let networkStub = NetworkClientSuccessStub(fileName: "user-profile", url: url)
        let sut = FinanceService(networkClient: networkStub)

        sut.fetchUserProfile { userProfile in
            self.spy = userProfile
        }

        let unwrappedSpy = try XCTUnwrap(spy)

        XCTAssertEqual(unwrappedSpy, userProfileObject)
        XCTAssertEqual(networkStub.callCount, 1)
        XCTAssertEqual(networkStub.url, url)
    }

    func test_ShouldReturnNil_WhenDataIsInvalid() throws {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/user_profile_endpoint.json")!
        let networkStub = NetworkClientFailureStub(url: url)
        let sut = FinanceService(networkClient: networkStub)

        sut.fetchUserProfile { userProfile in
            self.spy = userProfile
        }

        XCTAssertNil(spy)
        XCTAssertEqual(networkStub.callCount, 1)
        XCTAssertEqual(networkStub.url, url)
    }

    func test_ShouldReturnError_WhenJsonIsInvalid() throws {
        
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/user_profile_endpoint.json")!
        let networkStub = NetworkClientSuccessStub(fileName: "user-profile-invalid", url: url)
        let sut = FinanceService(networkClient: networkStub)

        sut.fetchUserProfile { userProfile in
            self.spy = userProfile
        }

        XCTAssertNil(spy)
        XCTAssertEqual(networkStub.callCount, 1)
        XCTAssertEqual(networkStub.url, url)
    }
}
