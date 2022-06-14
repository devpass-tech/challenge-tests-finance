//
//  HomeViewModelTests.swift
//  FinanceAppTests
//
//  Created by Hyago Henrique on 14/06/22.
//

import Foundation
@testable import FinanceApp
import XCTest

class HomeViewModelTests: XCTestCase {
    private var onSuccessHandler: ((_ data: HomeData) -> Void)?
    
    func test_fetchData_ShouldReturnValidData() {
        // Given
        let fakeApi = FakeFinanceService(nilData: false, successData: true)
        var sut = HomeViewModel(financeService: fakeApi)
        sut.delegate = self
        
        // When
        sut.fetchData()
        
        // Then
        onSuccessHandler = { homeData in
            XCTAssertEqual(homeData, responseFetchHomeData)
        }
    }
    
    func test_fetchData_ShouldReturnNilData() {
        // Given
        let fakeApi = FakeFinanceService(nilData: true, successData: false)
        var sut = HomeViewModel(financeService: fakeApi)
        sut.delegate = self
        
        // When
        sut.fetchData()
        
        // Then
        XCTAssertTrue(true)
    }
    
}

extension HomeViewModelTests: HomeViewModelDelegate {
    func didFetchHomeData(_ data: HomeData) {
        onSuccessHandler?(data)
    }
}
