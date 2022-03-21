//
//  ActivityCellViewSnapshotTests.swift
//  FinanceAppTests
//
//  Created by pedro tres on 21/03/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

class ActivityCellViewSnapshotTests: XCTestCase {
    let size = CGSize(width: 374, height: 70)
    let isRecord = false
    
    func test_ActivityCellView_allFields() {
        let configuration = ActivityCellViewConfiguration(image: "bag.circle.fill", name: "Mall", information: "$100.00 • 8:57 AM")
        
        let activityCellView = ActivityCellView()
        activityCellView.backgroundColor = .white
        activityCellView.updateView(with: configuration)
        
        assertSnapshot(matching: activityCellView, as: .image(size: size), record: isRecord)
    }
    
    func test_ActivityCellView_should_emptyImage_when_noImage() {
        let configuration = ActivityCellViewConfiguration(image: "", name: "Mall", information: "$100.00 • 8:57 AM")
        
        let activityCellView = ActivityCellView()
        activityCellView.backgroundColor = .white
        activityCellView.updateView(with: configuration)
        
        assertSnapshot(matching: activityCellView, as: .image(size: size), record: isRecord)
    }
    
    func test_ActivityCellView_should_emptyName_when_noName() {
        let configuration = ActivityCellViewConfiguration(image: "bag.circle.fill", name: "", information: "$100.00 • 8:57 AM")
        
        let activityCellView = ActivityCellView()
        activityCellView.backgroundColor = .white
        activityCellView.updateView(with: configuration)
        
        assertSnapshot(matching: activityCellView, as: .image(size: size), record: isRecord)
    }
    
    func test_ActivityCellView_should_emptyInformation_when_noInformation() {
        let configuration = ActivityCellViewConfiguration(image: "bag.circle.fill", name: "Mall", information: "")
        
        let activityCellView = ActivityCellView()
        activityCellView.backgroundColor = .white
        activityCellView.updateView(with: configuration)
        
        assertSnapshot(matching: activityCellView, as: .image(size: size), record: isRecord)
    }
    
    func test_ActivityCellView_should_name_when_longName() {
        let configuration = ActivityCellViewConfiguration(image: "bag.circle.fill", name: "Mallllllllllllllllllllllll is Malllll Long Mallll veryy longgg", information: "$100.00 • 8:57 AM")
        
        let activityCellView = ActivityCellView()
        activityCellView.backgroundColor = .white
        activityCellView.updateView(with: configuration)
        
        assertSnapshot(matching: activityCellView, as: .image(size: size), record: isRecord)
    }
    
    func test_ActivityCellView_should_information_when_longInformation() {
        let configuration = ActivityCellViewConfiguration(image: "bag.circle.fill", name: "Mall", information: "$999,999,999,999,999,999,999,999,999.00 • 8:57 AM")
        
        let activityCellView = ActivityCellView()
        activityCellView.backgroundColor = .white
        activityCellView.updateView(with: configuration)
        
        assertSnapshot(matching: activityCellView, as: .image(size: size), record: isRecord)
    }
}
