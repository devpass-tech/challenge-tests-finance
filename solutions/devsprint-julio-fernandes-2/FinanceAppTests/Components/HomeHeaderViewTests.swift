//
//  HomeHeaderViewTests.swift
//  FinanceAppTests
//
//  Created by Dairan on 19/04/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

final class HomeHeaderViewTests: XCTestCase {
    
    private let size: CGSize = .init(width: 320, height: 140)
    private let lightMode = UITraitCollection(userInterfaceStyle: .light)
    private let darkMode = UITraitCollection(userInterfaceStyle: .dark)
    
    private var sut: HomeHeaderView?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HomeHeaderView()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_initCoder() {
        let sut = HomeHeaderView(coder: NSCoder())
        XCTAssertNil(sut)
    }

    func test_HomeHeaderView_LightContent() throws {
        let sut = try XCTUnwrap(sut)
        sut.backgroundColor = .white
        assertSnapshot(matching: sut, as: .image(size: size, traits: lightMode))
    }

    func test_HomeHeaderView_DarkContent() throws {
        let sut = try XCTUnwrap(sut)
        sut.backgroundColor = .black
        assertSnapshot(matching: sut, as: .image(size: size, traits: darkMode))
    }
}
