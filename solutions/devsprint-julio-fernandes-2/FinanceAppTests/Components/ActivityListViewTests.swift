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
    
    private let size = CGSize(width: 320, height: 500)
    private let lightMode = UITraitCollection(userInterfaceStyle: .light)
    private let darkMode = UITraitCollection(userInterfaceStyle: .dark)
    
    private var sut: ActivityListView?

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ActivityListView()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_initCoder() {
        let sut = ActivityListView(coder: NSCoder())
        XCTAssertNil(sut)
    }
    
    func test_didSelectedActivity() throws {
        let delegate = ActivityListViewDelegateSpy()
        sut?.delegate = delegate
        
        let tableview = try XCTUnwrap(sut?.tableView)
        sut?.tableView(tableview, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(delegate.didSelectedActivityCalled)
    }

    func test_ActivityListView_LightMode() throws {
        let sut = try XCTUnwrap(sut)
        assertSnapshot(matching: sut, as: .image(size: size, traits: lightMode))
    }
    
    func test_ActivityListView_DarkMode() throws {
        let sut = try XCTUnwrap(sut)
        assertSnapshot(matching: sut, as: .image(size: size, traits: darkMode))
    }
}

final class ActivityListViewDelegateSpy: ActivityListViewDelegate {
    
    private(set) var didSelectedActivityCalled = false
    func didSelectedActivity() {
        didSelectedActivityCalled = true
    }

}
