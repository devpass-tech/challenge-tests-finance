//
//  ActivityCellViewTests.swift
//  FinanceAppTests
//
//  Created by Dairan on 19/04/22.
//

@testable import FinanceApp
import SnapshotTesting
import XCTest

class ActivityCellViewTests: XCTestCase {
    func test_ActivityCellView_WhiteBackground() throws {
        
        let size: CGSize = .init(width: 320, height: 120)
        
        let sut = ActivityCellView()
        sut.backgroundColor = .white
        
        assertSnapshot(matching: sut, as: .image(size: size), record:  false)
    }
}
