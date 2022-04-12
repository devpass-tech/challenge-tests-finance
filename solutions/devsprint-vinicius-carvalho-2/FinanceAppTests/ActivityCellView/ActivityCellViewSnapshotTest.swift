//
//  ActivityCellViewSnapshotTest.swift
//  FinanceAppTests
//
//  Created by Bruno Silva on 05/04/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

class ActivityCellViewSnapshotTest: XCTestCase {
    
    // MARK: - Private Properties
    private let recorded: Bool = false
    private let sizeView: CGRect = CGRect(x: 0, y: 0, width: 500, height: 250)
    
    // MARK: - LifeCycle
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}
    
    // MARK: - Public Tests
    func test_ActivityCellView_ShouldReturnAImage() {
        let activityCellView: ActivityCellView = ActivityCellView(frame: sizeView)
        
        SnapshotTesting.isRecording = recorded
        
        assertSnapshot(matching: activityCellView, as: .image)
    }
}
