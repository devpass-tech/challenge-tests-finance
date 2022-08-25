//
//  ActivityViewCellSnapshotTests.swift
//  FinanceAppTests
//
//  Created by Raline Maria da Silva on 24/08/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

final class AcitivityCellViewSnapshotTests: XCTestCase {
    
    private let size320x120: CGSize = .init(width: 320, height: 120)
    private let size420x120: CGSize = .init(width: 420, height: 120)
    
    override func setUp() {
        SnapshotTesting.isRecording = false
    }
    
    func testActivityCell() {
        let activityCell = ActivityCellView()
        activityCell.backgroundColor = .white
        
        assertSnapshot(matching: activityCell, as: .image(size: size320x120), named: "ActivityCellView-320x120")
        assertSnapshot(matching: activityCell, as: .image(size: size420x120), named: "ActivityCellView-420x120")
    }
    
}
