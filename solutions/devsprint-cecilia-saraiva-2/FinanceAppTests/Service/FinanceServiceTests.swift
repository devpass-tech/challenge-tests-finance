//
//  FinanceServiceTests.swift
//  FinanceAppTests
//
//  Created by Vitor Conceicao on 16/08/22.
//

import XCTest
@testable import FinanceApp

final class FinanceServiceTests: XCTestCase {
    
    func test_fetchHomeData_shouldnCallWithCorrectURLWhenCalled() {
        let (sut, networkClient) = makeSut()
        let stringURL = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json"
        
        let expectation = XCTestExpectation(description: "Wait request")
        
        sut.fetchHomeData { _ in
            XCTAssertTrue(networkClient.performRequestCalled)
            XCTAssertEqual(networkClient.calledMethods, [.performRequest(url: stringURL)])
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }

    func test_fetchHomeData_shouldReturnNilWhenRequestReturnNil() {
        let (sut, networkClient) = makeSut()

        let expectation = XCTestExpectation(description: "Wait request")
        
        sut.fetchHomeData { response in
            XCTAssertTrue(networkClient.performRequestCalled)
            XCTAssertNil(response)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    func test_fetchHomeData_shouldReturnNilWhenRequestReturnEmptyData() {
        let (sut, networkClient) = makeSut(data: Data())

        let expectation = XCTestExpectation(description: "Wait request")
        
        sut.fetchHomeData { response in
            XCTAssertTrue(networkClient.performRequestCalled)
            XCTAssertNil(response)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    func test_fetchHomeData_shouldReturnHomeDataWhenRequestReturnCorrectData() throws {
        let activity = ActivityMock(name: "Market", price: 10.0, time: "12:00:00")
        let homeData = HomeDataMock(balance: 100.0, savings: 200.0, spending: 150, activity: [activity])
        let encode = try XCTUnwrap(JSONEncoder().encode(homeData))
        let (sut, networkClient) = makeSut(data: Data(encode))

        let expectation = XCTestExpectation(description: "Wait request")
        
        sut.fetchHomeData { response in
            XCTAssertTrue(networkClient.performRequestCalled)
            XCTAssertEqual(response?.balance, 100.0)
            XCTAssertEqual(response?.activity.first?.name, "Market")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.1)
    }
    
    private func makeSut(data: Data? = nil) -> (FinanceService, NetworkClientSpy) {
        let networkClient = NetworkClientSpy(data: data)
        let sut = FinanceService(networkClient: networkClient)
        
        return (sut, networkClient)
    }
}
