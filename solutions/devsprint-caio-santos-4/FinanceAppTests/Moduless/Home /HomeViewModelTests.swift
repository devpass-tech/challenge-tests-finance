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
    private let spy = HomeViewModelDelegateSpy()

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_whenViewModelHasDelegateAndCallFetchDataWithValidJson_shouldCallDidFetchHomeData() {
        sut = HomeViewModel(financeService: ServiceMockForHomeData(serviceMockResponseType: .valid))
        sut.delegate = spy
        callFetchData {
            XCTAssertTrue(self.spy.fetchHomeDataWasCalled)
        }
    }

    func test_whenViewModelHasDelegateAndCallFetchDataWithInvalidJson_shouldntCallDidFetchHomeData() {

        sut = HomeViewModel(financeService: ServiceMockForHomeData(serviceMockResponseType: .invalid))
        sut.delegate = spy
        callFetchData {
            XCTAssertFalse(self.spy.fetchHomeDataWasCalled)
        }
    }

    func test_viewModelWithoutDelegateAndCallFetchDataWithValidJson_shouldntCallDidFetchHomeData() {

        sut = HomeViewModel(financeService: ServiceMockForHomeData(serviceMockResponseType: .valid))
        callFetchData {
            XCTAssertFalse(self.spy.fetchHomeDataWasCalled)
        }
    }

    // MARK: - Private Methods
    private func callFetchData(completion: @escaping () -> ()) {

        sut.fetchData()
        let expectation = expectation(description: "async test")
        DispatchQueue.main.async {
            expectation.fulfill()
            completion()
        }
        waitForExpectations(timeout: 1)
    }
}
