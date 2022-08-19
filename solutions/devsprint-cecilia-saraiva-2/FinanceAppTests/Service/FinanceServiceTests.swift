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
        
        sut.fetchHomeData { _ in
            XCTAssertEqual(networkClient.calledMethods, [.performRequest(url: stringURL)])
        }
    }

    func test_fetchHomeData_shouldReturnNilWhenRequestReturnNil() {
        let (sut, networkClient) = makeSut()
        
        sut.fetchHomeData { response in
            XCTAssertTrue(networkClient.wasPerformRequestCalled)
            XCTAssertNil(response)
        }
    }
    
    func test_fetchHomeData_shouldReturnNilWhenRequestReturnEmptyData() {
        let (sut, networkClient) = makeSut(data: Data())
        
        sut.fetchHomeData { response in
            XCTAssertTrue(networkClient.wasPerformRequestCalled)
            XCTAssertNil(response)
        }
    }
    
    func test_fetchHomeData_shouldReturnHomeDataWhenRequestReturnCorrectData() throws {
        let activity = Activity(name: "Market", price: 10.0, time: "12:00:00")
        let homeData = HomeData(balance: 100.0, savings: 200.0, spending: 150, activity: [activity])
        let encodedHomeData = try XCTUnwrap(JSONEncoder().encode(homeData))
        let (sut, networkClient) = makeSut(data: Data(encodedHomeData))
        
        sut.fetchHomeData { response in
            XCTAssertTrue(networkClient.wasPerformRequestCalled)
            XCTAssertEqual(response?.balance, 100.0)
            XCTAssertEqual(response?.activity.first?.name, "Market")
        }
    }
    
    private func makeSut(data: Data? = nil) -> (FinanceService, NetworkClientSpy) {
        let networkClient = NetworkClientSpy(data: data)
        let sut = FinanceService(networkClient: networkClient)
        
        return (sut, networkClient)
    }
}
