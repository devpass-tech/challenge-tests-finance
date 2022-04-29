//
//  TabBarControllerTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 29/04/22.
//

import SnapshotTesting
import XCTest
@testable import FinanceApp

final class TabBarControllerTests: XCTestCase {
    
    var sut: TabBarController?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = TabBarController()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_viewDidLoad() {
        sut?.viewDidLoad()
        XCTAssertNil(sut?.viewControllers)
    }
    
    func test_viewWillAppear() {
        sut?.viewWillAppear(true)
        XCTAssertNotNil(sut?.viewControllers)
        XCTAssertEqual(sut?.viewControllers?.count, 2)
    }
}
