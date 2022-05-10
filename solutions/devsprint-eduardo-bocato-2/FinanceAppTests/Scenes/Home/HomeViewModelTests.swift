//
//  HomeViewModelTests.swift
//  FinanceAppTests
//
//  Created by Murillo R. Araújo on 03/05/22.
//

import XCTest
@testable import FinanceApp

final class HomeViewModelTests: XCTestCase {

    private let service = HomeServiceStub.self
    private let homeViewModelDelegateSpy: HomeViewModelDelegateSpy = .init()

    private lazy var sut: HomeViewModel = {
        var viewModel = HomeViewModel(
            homeService: service
        )
        viewModel.delegate = homeViewModelDelegateSpy
        return viewModel
    }()

    func test_fetchData_whenServiceReturnsNil_didFetchHomeDataShouldNotBeCalled() {
        // Given
        let homeDataMock: HomeData? = nil
        service.homeDataToBeReturned = homeDataMock

        // When
        sut.fetchData()

        // Then
        XCTAssertNil(homeViewModelDelegateSpy.dataPassed)
        XCTAssertFalse(homeViewModelDelegateSpy.didFetchHomeDataCalled)
    }

    func test_fetchData_whenServiceReturnsValidData_didFetchHomeDataShouldBeCalled() {
        // Given
        let homeDataMock: HomeData = .fixture()
        service.homeDataToBeReturned = homeDataMock

        // When
        sut.fetchData()

        // Then
        XCTAssertNotNil(homeViewModelDelegateSpy.dataPassed)
        XCTAssertTrue(homeViewModelDelegateSpy.didFetchHomeDataCalled)
    }
}
