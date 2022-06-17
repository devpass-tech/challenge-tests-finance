//
//  ActivityCellViewSnapshotTests.swift
//  FinanceAppTests
//
//  Created by Elena Diniz on 6/16/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

class ActivityCellViewSnapshotTests: XCTestCase {
    
    let componentSize = CGSize(width: 414, height: 149)
    
    override func setUp() {
        SnapshotTesting.isRecording = true
    }
    
    func test_HomeHeaderView() {
        let activityVC = ActivityCellView()
        activityVC.backgroundColor = .blue
        
        assertSnapshot(matching: activityVC, as: .image(size: componentSize))
    }
}
