//
//  ActivityDetailsViewModelTests.swift
//  FinanceAppUITests
//
//  Created by vinicius.carvalho on 11/04/22.
//

import XCTest

@testable import FinanceApp

final class ActivityDetailsViewModelTests: XCTestCase {

    // MARK: - Initializers

    private func makeSut(with networkClient: NetworkClientProtocol) -> (
        sut: ActivityDetailsViewModel,
        delegate: ActivityDetailsViewModelDelegateSpy
    ) {
        let delegate = ActivityDetailsViewModelDelegateSpy()
        let service = FinanceService(networkClient: networkClient)
        var sut = ActivityDetailsViewModel(financeService: service)
        sut.delegate = delegate

        return (sut, delegate)
    }

    func test_fetchData_withValidJson_shouldCallWithSuccess() {
        // Given
        let (sut, delegate) = makeSut(with: NetworkClientMockSuccess())
        // When
        sut.fetchData()
        // Then
        XCTAssertTrue(delegate.displayedActivityDetails)
    }

    func test_fetchData_withInvalidJson_shouldCallWithError() {
        let (sut, delegate) = makeSut(with: NetworkClientMockNil())

        sut.fetchData()

        XCTAssertFalse(delegate.displayedActivityDetails)
    }
}
