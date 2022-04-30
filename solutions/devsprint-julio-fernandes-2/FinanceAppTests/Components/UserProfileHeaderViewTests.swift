//
//  UserProfileHeaderViewTests.swift
//  FinanceAppTests
//
//  Created by Pedro Henrique Martins Barbosa on 25/04/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

final class UserProfileHeaderViewTests: XCTestCase {
    
    private let size: CGSize = .init(width: 400, height: 300)
    private let lightMode = UITraitCollection(userInterfaceStyle: .light)
    private let darkMode = UITraitCollection(userInterfaceStyle: .dark)
    
    private var sut: UserProfileHeaderView?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = UserProfileHeaderView()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_initCoder() {
        let sut = UserProfileHeaderView(coder: NSCoder())
        XCTAssertNil(sut)
    }
    
    func test_UserProfileHeaderView_LightMode() throws {
        let sut = try XCTUnwrap(sut)
        sut.backgroundColor = .white
        assertSnapshot(matching: sut, as: .image(size: size, traits: lightMode))
    }
    
    func test_UserProfileHeaderView_DarkMode() throws {
        let sut = try XCTUnwrap(sut)
        sut.backgroundColor = .black
        assertSnapshot(matching: sut, as: .image(size: size, traits: darkMode))
    }
}
