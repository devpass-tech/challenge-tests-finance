//
//  HomeViewModelTests.swift
//  FinanceAppTests
//
//  Created by Leonardo Cunha on 24/06/22.
//

import XCTest
@testable import FinanceApp

final class HomeViewModelTests: XCTestCase {
    private let networkSpy = NetworkClientSpy()
    private let financeService = FinanceService(networkClient: networkSpy)
    private let sut = HomeViewModel(financeService: financeService,
                                    mainDispatchQueue: DispatchQueueSpy())
    
    
    func test_whenFetchDataIsCalled_dispatchQueueShouldBeCalled() {
        
    }
    
}
