//
//  TabBarControllerTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 29/04/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

final class TabBarControllerTests: XCTestCase {
    
    private var sut: TabBarController?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = TabBarController()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
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
