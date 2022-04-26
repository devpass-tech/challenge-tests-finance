//
//  ActivityListViewTests.swift
//  FinanceAppTests
//
//  Created by Dairan on 25/04/22.
//

@testable import FinanceApp
import SnapshotTesting
import XCTest

class ActivityListViewTests: XCTestCase {
    private var sut: ActivityListView?
    let size = CGSize(width: 320, height: 500)
    let lightMode = UITraitCollection(userInterfaceStyle: .light)
    let darkMode = UITraitCollection(userInterfaceStyle: .dark)

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ActivityListView()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_ActivityListView_LightMode() throws {
        let sut = try XCTUnwrap(sut)
        assertSnapshot(matching: sut, as: .image(size: size, traits: lightMode), record: false)
    }
    
    func test_ActivityListView_DarkMode() throws {
        let sut = try XCTUnwrap(sut)
        assertSnapshot(matching: sut, as: .image(size: size, traits: darkMode), record: false)
    }
}
