//
//  HomeHeaderViewSnapshotTests.swift
//  FinanceAppTests
//
//  Created by pedro tres on 15/03/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

class HomeHeaderViewSnapshotTests: XCTestCase {
    let size = CGSize(width: 414, height: 149)
    let isRecord = false
    
    func test_homeHeaderView_whenSnapshot_shouldSucceed() {
        let configuration = HomeHeaderViewConfiguration(label: "$15,459.27", savingsValueLabel: "$100.00", spendingValueLabel: "$100.00")
        let homeHeaderView = HomeHeaderView()
        homeHeaderView.backgroundColor = .white
        homeHeaderView.updateView(with: configuration)
        
        assertSnapshot(matching: homeHeaderView, as: .image(size: size), record: isRecord)
    }
    
    func test_homeHeaderView_whenSnapshot_noLabel() {
        let configuration = HomeHeaderViewConfiguration(label: "", savingsValueLabel: "$100.00", spendingValueLabel: "$100.00")
        let homeHeaderView = HomeHeaderView()
        homeHeaderView.backgroundColor = .white
        homeHeaderView.updateView(with: configuration)
        
        assertSnapshot(matching: homeHeaderView, as: .image(size: size), record: isRecord)
    }
    
    func test_homeHeaderView_whenSnapshot_noSavingsValue() {
        let configuration = HomeHeaderViewConfiguration(label: "$15,459.27", savingsValueLabel: "", spendingValueLabel: "$100.00")
        let homeHeaderView = HomeHeaderView()
        homeHeaderView.backgroundColor = .white
        homeHeaderView.updateView(with: configuration)
        
        assertSnapshot(matching: homeHeaderView, as: .image(size: size), record: isRecord)
    }
    
    func test_homeHeaderView_whenSnapshot_noSpedingValue() {
        let configuration = HomeHeaderViewConfiguration(label: "$15,459.27", savingsValueLabel: "$100.00", spendingValueLabel: "")
        let homeHeaderView = HomeHeaderView()
        homeHeaderView.backgroundColor = .white
        homeHeaderView.updateView(with: configuration)
        
        assertSnapshot(matching: homeHeaderView, as: .image(size: size), record: isRecord)
    }
    
    func test_homeHeaderView_whenSnapshot_longLabel() {
        let configuration = HomeHeaderViewConfiguration(label: "$15,459,567.27", savingsValueLabel: "$100.00", spendingValueLabel: "$100.00")
        let homeHeaderView = HomeHeaderView()
        homeHeaderView.backgroundColor = .white
        homeHeaderView.updateView(with: configuration)
        
        assertSnapshot(matching: homeHeaderView, as: .image(size: size), record: isRecord)
    }
    
    func test_homeHeaderView_whenSnapshot_longSavingsValue() {
        let configuration = HomeHeaderViewConfiguration(label: "$15,459.27", savingsValueLabel: "$10,000,000.00", spendingValueLabel: "$100.00")
        let homeHeaderView = HomeHeaderView()
        homeHeaderView.backgroundColor = .white
        homeHeaderView.updateView(with: configuration)
        
        assertSnapshot(matching: homeHeaderView, as: .image(size: size), record: isRecord)
    }
    
    func test_homeHeaderView_whenSnapshot_longSpedingValue() {
        let configuration = HomeHeaderViewConfiguration(label: "$15,459.27", savingsValueLabel: "$100.00", spendingValueLabel: "$44,000,000.00")
        let homeHeaderView = HomeHeaderView()
        homeHeaderView.backgroundColor = .white
        homeHeaderView.updateView(with: configuration)
        
        assertSnapshot(matching: homeHeaderView, as: .image(size: size), record: isRecord)
    }
}
