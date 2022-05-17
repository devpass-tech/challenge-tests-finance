//
//   HomeHeaderViewSnapshotTests.swift
//  FinanceAppTests
//
//  Created by Home on 16/05/22.
//

import XCTest
import SnapshotTesting
@testable import FinanceApp

class HomeHeaderViewSnapshotTests: XCTestCase {
    
    private let size = CGSize(width: 414, height: 149)
    private let isRecord = true
    private var sut: HomeHeaderView!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HomeHeaderView()
        sut.backgroundColor = .white
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_HomeHeaderView_allFields() {
        let configuration = HomeHeaderViewConfiguration(amountLabel: "R$ 10.000,00",
                                                        savingsLabel: "Savings",
                                                        savingsValueLabel: "R$ 200,00",
                                                        spendingLabel: "Spending",
                                                        spendingValueLabel: "R$ 200,00")
        
        sut.configure(with: configuration)
        
        assertSnapshot(matching: sut, as: .image(size: size), record: isRecord)
    }
    
    func test_HomeHeaderView_shouldShowEmptyLabel() {
        let configuration = HomeHeaderViewConfiguration(amountLabel: String(),
                                                        savingsLabel: "Savings",
                                                        savingsValueLabel: "R$ 200,00",
                                                        spendingLabel: "Spending",
                                                        spendingValueLabel: "R$ 200,00")
        
        
        sut.configure(with: configuration)
        
        assertSnapshot(matching: sut, as: .image(size: size), record: isRecord)
    }
}
