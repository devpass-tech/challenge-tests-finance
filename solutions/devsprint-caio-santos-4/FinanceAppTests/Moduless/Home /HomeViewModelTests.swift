//
//  HomeViewModelTests.swift
//  FinanceAppTests
//
//  Created by Isabella Bencardino on 16/06/2022.
//

import XCTest
@testable import FinanceApp

class HomeViewModelTests: XCTestCase {

    var sut: HomeViewModel!
    var spy: HomeViewModelDelegateSpy!

    override func setUpWithError() throws {
        spy = HomeViewModelDelegateSpy()
    }

    override func tearDownWithError() throws {
        sut = nil
    }


    func test_whenViewModelHasDelegateAndCallFetchDataWithValidJson_shouldCallDidFetchHomeData() {
        // GIVEN
        sut = HomeViewModel(financeService: ServiceMockForHomeData(serviceMockResponseType: .valid))

        // WHEN
        sut.delegate = spy

        // THEN
        sut.fetchData()
        let expectation = expectation(description: "async test")
        DispatchQueue.main.async {
            expectation.fulfill()
            XCTAssertTrue(self.spy.fetchHomeDataWasCalled)
        }
        waitForExpectations(timeout: 1)
    }

    func test_whenViewModelHasDelegateAndCallFetchDataWithInvalidJson_shouldntCallDidFetchHomeData() {
        // GIVEN
        sut = HomeViewModel(financeService: ServiceMockForHomeData(serviceMockResponseType: .invalid))

        // WHEN
        sut.delegate = spy

        // THEN
        sut.fetchData()
        let expectation = expectation(description: "async test")
        DispatchQueue.main.async {
            expectation.fulfill()
            XCTAssertFalse(self.spy.fetchHomeDataWasCalled)
        }
        waitForExpectations(timeout: 1)
    }

    func test_viewModelWithoutDelegateAndCallFetchDataWithEmptyJson_shouldntCallDidFetchHomeData() {

        // GIVEN
        sut = HomeViewModel(financeService: ServiceMockForHomeData(serviceMockResponseType: .empty))

        // WHEN
        sut.delegate = spy

        // THEN
        sut.fetchData()
        let expectation = expectation(description: "async test")
        DispatchQueue.main.async {
            expectation.fulfill()
            XCTAssertFalse(self.spy.fetchHomeDataWasCalled)
        }
        waitForExpectations(timeout: 1)
    }
}
