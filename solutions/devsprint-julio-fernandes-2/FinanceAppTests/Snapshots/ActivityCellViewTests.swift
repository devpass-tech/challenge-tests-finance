//
//  ActivityCellViewTests.swift
//  FinanceAppTests
//
//  Created by Dairan on 19/04/22.
//

@testable import FinanceApp
import SnapshotTesting
import XCTest

final class ActivityCellViewTests: XCTestCase {
    private var sut: ActivityCellView?
    private let size: CGSize = .init(width: 320, height: 120)

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ActivityCellView()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

     func test_ActivityCellView_LightContent() throws {
        let sut = try XCTUnwrap(sut)
        sut.backgroundColor = .white
        assertSnapshot(matching: sut, as: .image(size: size, traits: .init(userInterfaceStyle: .light)), record: false)
    }
    
    func test_ActivityCellView_DarkContent() throws {
        let sut = try XCTUnwrap(sut)
        sut.backgroundColor = .black
        assertSnapshot(matching: sut, as: .image(size: size, traits: .init(userInterfaceStyle: .dark)), record: false)
    }
}
