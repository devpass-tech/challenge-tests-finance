//
//  UserProfileHeaderViewTests.swift
//  FinanceAppTests
//
//  Created by Pedro Henrique Martins Barbosa on 25/04/22.
//

import SnapshotTesting
import XCTest
@testable import FinanceApp

final class UserProfileHeaderViewTests: XCTestCase {
    var sut: UserProfileHeaderView?
    let size: CGSize = .init(width: 400, height: 300)
    
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
        assertSnapshot(matching: sut, as: .image(size: size, traits: .init(userInterfaceStyle: .light)), record: false)
    }
    
    func test_UserProfileHeaderView_DarkMode() throws {
        let sut = try XCTUnwrap(sut)
        sut.backgroundColor = .black
        assertSnapshot(matching: sut, as: .image(size: size, traits: .init(userInterfaceStyle: .dark)), record: false)
    }
}
