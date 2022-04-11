//
//  HomeViewModelTests.swift
//  FinanceAppUITests
//
//  Created by vinicius.carvalho on 09/04/22.
//

import XCTest

@testable import FinanceApp

final class HomeViewModelTests: XCTestCase {

    private func makeSut(with networkClient: NetworkClientProtocol) -> (
        sut: HomeViewModel,
        delegate: HomeViewModelDelegateSpy
    ) {
        let delegate = HomeViewModelDelegateSpy()
        let service = FinanceService(networkClient: networkClient)
        var sut = HomeViewModel(financeService: service)
        sut.delegate = delegate

        return (sut, delegate)
    }

    func test_fetchData_withValidJson_shouldCallWithSuccess() {
        let (sut, delegate) = makeSut(with: NetworkClientHomeMockSuccess())

        sut.fetchData()

        XCTAssertTrue(delegate.displayHomeData)
    }

}
