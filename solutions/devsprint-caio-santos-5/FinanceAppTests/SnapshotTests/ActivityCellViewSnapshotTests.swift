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
    
    let componentSize = CGSize(width: 414, height: 100)
    
    override func setUp() {
//        SnapshotTesting.isRecording = true
    }
    
    func test_ActivityCellView() {
        let activityVC = ActivityCellView()
        activityVC.backgroundColor = .white
        
        assertSnapshot(matching: activityVC, as: .image(size: componentSize))
    }
}
