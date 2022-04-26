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
    
    private func test_HomeHeaderView() throws {
        let sut = try XCTUnwrap(sut)
        assertSnapshot(matching: sut, as: .image(size: size), record: false)
    }
}
