//
//  HomeHeaderViewTests.swift
//  FinanceAppTests
//
//  Created by Dairan on 19/04/22.
//

@testable import FinanceApp
import SnapshotTesting
import XCTest

class HomeHeaderViewTests: XCTestCase {
    func test_HomeHeaderView() throws {
        let size: CGSize = .init(width: 320, height: 140)
        let sut = HomeHeaderView()

        assertSnapshot(matching: sut, as: .image(size: size), record: false)
    }
}
