//
//  HomeHeaderViewSnapshotTests.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 14/06/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

class HomeHeaderViewSnapshotTests: XCTestCase {
    let componentSize = CGSize(width: 414, height: 149)
    
    override func setUp() {
//        SnapshotTesting.isRecording = true
    }
    
    func test_HomeHeaderView() {
        let homeHeaderView = HomeHeaderView()
        homeHeaderView.backgroundColor = .white
        
        assertSnapshot(matching: homeHeaderView, as: .image(size: componentSize))
    }
}
