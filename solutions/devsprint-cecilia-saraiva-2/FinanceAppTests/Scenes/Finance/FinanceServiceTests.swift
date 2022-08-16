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
    func test_ShouldReturnUserProfileData() throws {
        var spy: UserProfile?
        let sut = FinanceServiceStub()
        
        sut.fetchUserProfile { userProfile in
            spy = userProfile
        }
        
        let unwrappedSpy = try XCTUnwrap(spy)
        
        XCTAssertEqual(unwrappedSpy.name, "Irma Flores")
        XCTAssertEqual(unwrappedSpy.phone, "+55 (11) 99999-9999")
        XCTAssertEqual(unwrappedSpy.email, "irma@devpass.com.br")
        XCTAssertEqual(unwrappedSpy.address, "Rua Bela Cintra, 495")
        XCTAssertEqual(unwrappedSpy.account.agency, "0001")
        XCTAssertEqual(unwrappedSpy.account.account, "123456-7")
    }
}
