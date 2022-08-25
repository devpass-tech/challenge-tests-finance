//
//  ActivityViewCellSnapshotTests.swift
//  FinanceAppTests
//
//  Created by Raline Maria da Silva on 24/08/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

class AcitivityCellViewSnapshotTests: XCTestCase {
    
    let size1: CGSize = .init(width: 320, height: 120)
    let size2: CGSize = .init(width: 420, height: 120)
    
    override func setUp() {
        SnapshotTesting.isRecording = false
    }
    
    func testActivityCell() {
        let activityCell = ActivityCellView()
        activityCell.backgroundColor = .white
        
        assertSnapshot(matching: activityCell, as: .image(size: size1))
        assertSnapshot(matching: activityCell, as: .image(size: size2))
    }
    
}
