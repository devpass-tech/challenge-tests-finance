//
//  HomeHeaderViewSnapshotTest.swift
//  FinanceAppTests
//
//  Created by Henrique Augusto on 11/04/22.
//

import XCTest
import SnapshotTesting

@testable import FinanceApp

class HomeHeaderViewSnapshotTest: XCTestCase {
    func test_HomeHeaderView() {
        let sut: HomeHeaderView = HomeHeaderView()
        
        assertSnapshot(matching: sut, as: .image(size: CGSize(width: 414, height: 149)))
    }
}
