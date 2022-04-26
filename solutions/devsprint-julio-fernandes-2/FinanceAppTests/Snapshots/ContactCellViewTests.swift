//
//  ContactCellViewTests.swift
//  FinanceAppTests
//
//  Created by Dairan on 25/04/22.
//

@testable import FinanceApp
import SnapshotTesting
import XCTest

final class ContactCellViewTests: XCTestCase {
    private var sut: ContactCellView?
    private let size = CGSize(width: 320, height: 120)
    private let lightMode = UITraitCollection(userInterfaceStyle: .light)
    private let darkMode = UITraitCollection(userInterfaceStyle: .dark)

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ContactCellView()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_ContactCellView_LightMode() throws {
        let sut = try XCTUnwrap(sut)
        sut.backgroundColor = .white
        assertSnapshot(matching: sut, as: .image(size: size, traits: lightMode), record: true)
    }

    func test_ContactCellView_DarktMode() throws {
        let sut = try XCTUnwrap(sut)
        sut.backgroundColor = .black
        assertSnapshot(matching: sut, as: .image(size: size, traits: darkMode), record: true)
    }
}
