//
//  HomeHeaderViewTests.swift
//  FinanceAppTests
//
//  Created by Dairan on 19/04/22.
//

@testable import FinanceApp
import SnapshotTesting
import XCTest

final class HomeHeaderViewTests: XCTestCase {
    private var sut: HomeHeaderView?
    private let size: CGSize = .init(width: 320, height: 140)

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HomeHeaderView()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_initCoder() {
        let sut = HomeHeaderView(coder: NSCoder())
        XCTAssertNil(sut)
    }

    func test_HomeHeaderView_LightContent() throws {
        let sut = try XCTUnwrap(sut)
        sut.backgroundColor = .white
        assertSnapshot(matching: sut, as: .image(size: size, traits: .init(userInterfaceStyle: .light)), record: false)
    }

    func test_HomeHeaderView_DarkContent() throws {
        let sut = try XCTUnwrap(sut)
        sut.backgroundColor = .black
        assertSnapshot(matching: sut, as: .image(size: size, traits: .init(userInterfaceStyle: .dark)), record: false)
    }
}
