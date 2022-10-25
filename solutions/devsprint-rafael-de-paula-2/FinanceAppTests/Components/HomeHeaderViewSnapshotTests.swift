//
//  HomeHeaderViewSnapshotTests.swift
//  FinanceAppTests
//
//  Created by Rafael de Paula on 24/10/22.
//

import SnapshotTesting
import XCTest
@testable import FinanceApp

final class HomeHeaderViewSnapshotTests: XCTestCase {
    private let isRecording = false
    private let size = CGSize(width: 390, height: 120)
    
    private lazy var sut = HomeHeaderView()
    
    func test_shouldReturnCorrectSnapshot() throws {
        assertSnapshot(matching: sut, as: .image(size: size), record: isRecording)
    }
}
