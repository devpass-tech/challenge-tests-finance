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
        
        url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/user_profile_endpoint.json")!
    }
    
    override func tearDown() {
        self.spy = nil
        self.callCount = 0
        self.userProfileObject = nil
        self.url = nil
    }

    func test_ShouldReturnUserProfileData() throws {
        let (sut, networkStub) = makeSut(fileName: "user-profile", url: url, isRequestSuccess: true)

        sut.fetchUserProfile { userProfile in
            self.spy = userProfile
        }

        let unwrappedSpy = try XCTUnwrap(spy)

        XCTAssertEqual(unwrappedSpy, userProfileObject)
        XCTAssertEqual(networkStub.performRequestCount, 1)
        XCTAssertEqual(networkStub.url, url)
    }

    func test_ShouldReturnNil_WhenDataIsInvalid() throws {
        let (sut, networkStub) = makeSut(fileName: "", url: url, isRequestSuccess: false)

        sut.fetchUserProfile { userProfile in
            self.spy = userProfile
        }

        XCTAssertNil(spy)
        XCTAssertEqual(networkStub.performRequestCount, 1)
        XCTAssertEqual(networkStub.url, url)
    }

    func test_ShouldReturnError_WhenJsonIsInvalid() throws {
        let (sut, networkStub) = makeSut(fileName: "user-profile-invalid", url: url, isRequestSuccess: true)

        sut.fetchUserProfile { userProfile in
            self.spy = userProfile
        }

        XCTAssertNil(spy)
        XCTAssertEqual(networkStub.performRequestCount, 1)
        XCTAssertEqual(networkStub.url, url)
    }
}

extension FinanceServiceTests {
    private func makeSut(fileName: String, url: URL?, isRequestSuccess: Bool) -> (FinanceService, NetworkClientStub) {
        let networkStub = NetworkClientStub(fileName: fileName, url: url, isRequestSuccess: isRequestSuccess)
        let sut = FinanceService(networkClient: networkStub)
        return (sut, networkStub)
    }
}
