//
//  ActivityDetailsViewModelTests.swift
//  FinanceAppTests
//
//  Created by Murillo R. Araújo on 24/03/22.
//

import XCTest
@testable import FinanceApp

class ActivityDetailsViewModelTests: XCTestCase {

    func test_fetchData_withValidJson_shouldCallWithSuccess() throws {
        let (sut, delegate) = makeSUT(with: NetworkClientActivityDetailsMockSuccess())
        sut.fetchData()
        XCTAssertTrue(delegate.displayedActivityDetails)
    }

    func test_fetchData_WithInvalidJson_shouldCallWithError() throws {
        let (sut, delegate) = makeSUT(with: NetworkClientActivityDetailsMockNil())
        sut.fetchData()
        XCTAssertFalse(delegate.displayedActivityDetails)
    }

    private func makeSUT(with networkClient: NetworkClientProtocol) -> (
        sut: ActivityDetailsViewModel,
        delegate: ActivityDetailsViewModelDelegateMock
    ) {
        let delegate = ActivityDetailsViewModelDelegateMock()
        let service = FinanceService(networkClient: networkClient)
        var sut = ActivityDetailsViewModel(financeService: service)
        sut.delegate = delegate

        return (sut, delegate)
    }
}
