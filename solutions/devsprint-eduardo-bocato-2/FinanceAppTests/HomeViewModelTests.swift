//
//  HomeViewModelTests.swift
//  FinanceAppTests
//
//  Created by Murillo R. Araújo on 03/05/22.
//

import XCTest
@testable import FinanceApp

class HomeViewModelTests: XCTestCase {

    var sut: HomeViewModel!
    let delegate = HomeViewModelDelegateMock()
    let service = FinanceServiceMock()

    override func setUp() {
        sut = HomeViewModel(with: service)
        sut.delegate = delegate
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_fetchData_withData_shouldCallWithSuccess() throws {
        sut.fetchData()
        XCTAssertTrue(delegate.displayedHomeData)
    }

    func test_fetchData_withoutData_shouldCallWithError() throws {
        service.errorAPI = .noData
        sut.fetchData()
        XCTAssertFalse(delegate.displayedError)
    }
}
