//
//  HomeViewModelTests.swift
//  FinanceAppTests
//
//  Created by Guilherme Strutzki on 18/04/22.
//

import XCTest

@testable import FinanceApp

final class HomeViewModelTests: XCTestCase {
    
    func test_fetchData_shouldTriggerCorrectlyWithSuccess() {
        let delegate = HomeViewModelDelegateSpy()
        let service = FinanceService(networkClient: NetworkClientHomeMockSuccess())
        
        var sut = HomeViewModel(financeService: service)
        sut.delegate = delegate
        
        sut.fetchData()
        
        XCTAssertTrue(delegate.showHomeData)
    }
}
