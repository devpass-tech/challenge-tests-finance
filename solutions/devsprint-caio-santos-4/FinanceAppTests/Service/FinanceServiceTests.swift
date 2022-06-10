//
//  FinanceServiceTests.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 10/06/22.
//

import XCTest
@testable import FinanceApp

class FinanceServiceTests: XCTestCase {
    
    // SUT - System Under Test
    var sut: FinanceService!

    override func setUpWithError() throws {
        sut = .init(networkClient: NetworkClientMock())
        let _ = try XCTUnwrap(sut)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_fetchHomeData_WithServiceDown_shouldReturnNil() {
        sut.fetchHomeData { homeData in
            XCTAssertNil(homeData)
        }
    }
    
    func test_fetchHomeData_WithServiceOnlineAndValidResponse_shouldReturnHomeData() throws {
        let data = try XCTUnwrap(homeDataJson)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let mock = try decoder.decode(HomeData.self, from: data)
        
        sut.fetchHomeData { homeData in
            XCTAssertEqual(homeData, mock)
        }
    }
    
    func test_fetchHomeData_WithServiceOnlineAndInvalidResponse_shouldReturnHomeData() {
        sut.fetchHomeData { homeData in

        }
    }
}

class NetworkClientMock: NetworkClientProtocol {
    
    // TODO: Fazer com que o performRequest se comporte de forma dinamica a cada cenário de teste...
    enum NetworkClientMockStatus {
        case empty
        case success
        case error
    }
    
    var status: NetworkClientMockStatus?
    
    init(status: NetworkClientMock.NetworkClientMockStatus? = nil) {
        self.status = status
    }
    
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        completion(nil)
//        completion(homeDataJson)
    }
}
