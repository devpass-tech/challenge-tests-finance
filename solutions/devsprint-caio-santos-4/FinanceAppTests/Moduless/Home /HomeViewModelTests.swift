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
        sut = HomeViewModel(financeService: ServiceMockForHomeData(serviceMockResponseType: .valid))
        callFetchData {
            XCTAssertTrue(self.spy.fetchHomeDataWasCalled)
        }
    }

    func test_whenViewModelHasDelegateAndCallFetchDataWithInvalidJson_shouldntCallDidFetchHomeData() {

        sut = HomeViewModel(financeService: ServiceMockForHomeData(serviceMockResponseType: .invalid))
        callFetchData {
            XCTAssertFalse(self.spy.fetchHomeDataWasCalled)
        }
    }

    func test_viewModelWithoutDelegateAndCallFetchDataWithEmptyJson_shouldntCallDidFetchHomeData() {

        sut = HomeViewModel(financeService: ServiceMockForHomeData(serviceMockResponseType: .empty))
        callFetchData {
            XCTAssertFalse(self.spy.fetchHomeDataWasCalled)
        }
    }

    private func callFetchData(completion: @escaping () -> ()) {
        sut.delegate = spy
        sut.fetchData()
        let expectation = expectation(description: "async test")
        DispatchQueue.main.async {
            expectation.fulfill()
            completion()
        }
        waitForExpectations(timeout: 1)
    }
}
