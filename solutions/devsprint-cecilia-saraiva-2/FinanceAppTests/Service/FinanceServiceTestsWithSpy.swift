//
//  FinanceServiceTests.swift
//  FinanceAppTests
//
//  Created by Vitor Conceicao on 16/08/22.
//

import XCTest
@testable import FinanceApp

final class FinanceServiceTestsWithSpy: XCTestCase {
    let stringURL = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json"

    func test_fetchHomeData_WhenRequestReturnNilShouldReturnNil() {
        let (sut, networkClient) = makeSUT()
        var out: HomeData?
        
        sut.fetchHomeData { response in
            out = response
        }
        
        XCTAssertEqual(networkClient.calledMethods, [.performRequest(url: stringURL)])
        XCTAssertNil(out)
    }
    
    func test_fetchHomeData_WhenDecodedFailShouldReturnNil() {
        let (sut, networkClient) = makeSUT(data: Data())
        var out: HomeData?
        
        sut.fetchHomeData { response in
            out = response
        }
        
        XCTAssertEqual(networkClient.calledMethods, [.performRequest(url: stringURL)])
        XCTAssertNil(out)
    }
    
    func test_fetchHomeData_shouldReturnHomeDataWhenRequestReturnCorrectData() throws {
        let activity = Activity(name: "Market", price: 10.0, time: "12:00:00")
        let homeData = HomeData(balance: 100.0, savings: 200.0, spending: 150, activity: [activity])
        let encodedHomeData = try XCTUnwrap(JSONEncoder().encode(homeData))
        let (sut, networkClient) = makeSUT(data: Data(encodedHomeData))
        var out: HomeData?
        
        sut.fetchHomeData { response in
            out = response
        }
        
        XCTAssertEqual(networkClient.calledMethods, [.performRequest(url: stringURL)])
        XCTAssertEqual(out, homeData)
    }
}

private extension FinanceServiceTestsWithSpy {
    func makeSUT(data: Data? = nil) -> (FinanceService, NetworkClientSpy) {
        let networkClient = NetworkClientSpy(data: data)
        let sut = FinanceService(networkClient: networkClient)
        
        return (sut, networkClient)
    }
}

extension HomeData: Equatable {
    public static func == (lhs: HomeData, rhs: HomeData) -> Bool {
        lhs.balance == rhs.balance && lhs.spending == rhs.spending && lhs.activity == rhs.activity && lhs.savings == rhs.savings
    }
}

extension Activity: Equatable {
    public static func == (lhs: Activity, rhs: Activity) -> Bool {
        lhs.name == rhs.name && lhs.price == rhs.price && lhs.time == rhs.time
    }
}
