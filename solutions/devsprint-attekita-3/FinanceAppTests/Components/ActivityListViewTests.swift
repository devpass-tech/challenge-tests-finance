//
//  ActivityListViewTests.swift
//  FinanceAppTests
//
//  Created by Matheus Góes on 19/05/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

class ActivityListViewTests: XCTestCase {
    private let isRecording = false
    private var sut: ActivityListView!
    private var viewSize = CGSize(width: 400, height: 500)
    private var mockVC: UIViewController!
    
    override func setUp() {
        sut = ActivityListView()
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testActivityListView_WhenSnapshotAssertInMultiplesDevices_ShouldBeCorrect() {
        mockVC = UIViewController()
        mockVC.view = sut
        
        assertSnapshot(matching: mockVC, as: .image(on: .iPhone8), record: isRecording)
        assertSnapshot(matching: mockVC, as: .image(on: .iPhoneX), record: isRecording)
        assertSnapshot(matching: mockVC, as: .image(on: .iPhone8Plus), record: isRecording)
        assertSnapshot(matching: mockVC, as: .image(on: .iPhoneXr), record: isRecording)
        assertSnapshot(matching: mockVC, as: .image(on: .iPhoneXsMax), record: isRecording)
    }

}
