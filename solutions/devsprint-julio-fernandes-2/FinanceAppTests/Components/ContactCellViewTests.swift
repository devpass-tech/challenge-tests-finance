//
//  ContactCellViewTests.swift
//  FinanceAppTests
//
//  Created by Dairan on 25/04/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

final class ContactCellViewTests: XCTestCase {
    
    private let size = CGSize(width: 320, height: 120)
    private let lightMode = UITraitCollection(userInterfaceStyle: .light)
    private let darkMode = UITraitCollection(userInterfaceStyle: .dark)
    
    private var sut: ContactCellView?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ContactCellView()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_initCoder() {
        let sut = ContactCellView(coder: NSCoder())
        XCTAssertNil(sut)
    }

    func test_ContactCellView_LightMode() throws {
        let sut = try XCTUnwrap(sut)
        sut.backgroundColor = .white
        assertSnapshot(matching: sut, as: .image(size: size, traits: lightMode))
    }

    func test_ContactCellView_DarktMode() throws {
        let sut = try XCTUnwrap(sut)
        sut.backgroundColor = .black
        assertSnapshot(matching: sut, as: .image(size: size, traits: darkMode))
    }
}
