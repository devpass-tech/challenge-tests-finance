//
//  HomeViewTests.swift
//  FinanceAppTests
//
//  Created by Julio Fernandes on 29/04/22.
//

import XCTest
@testable import FinanceApp

final class HomeViewTests: XCTestCase {

    private var sut: HomeView?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HomeView()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_initCoder() {
        let sut = HomeView(coder: NSCoder())
        XCTAssertNil(sut)
    }
    
    func test_didSelectedActivity() {
        let delegate = HomeViewDelegateSpy()
        sut?.delegate = delegate
        
        sut?.didSelectedActivity()
        XCTAssertTrue(delegate.didSelectActivityCalled)
    }

}

final class HomeViewDelegateSpy: HomeViewDelegate {
    
    private(set) var didSelectActivityCalled = false
    func didSelectActivity() {
        didSelectActivityCalled = true
    }
    
}
