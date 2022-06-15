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
    
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_fetchHomeData_WithServiceDown_shouldReturnNil() {
        sut = .init(networkClient: NetworkClientMock(.error))

        var homeDataResult = [HomeData?]()
        
        sut.fetchHomeData { homeData in
            homeDataResult.append(homeData)
        }
        
        continueAfterFailure = true
        XCTAssertEqual(homeDataResult.count, 1)
        XCTAssertNil(homeDataResult.first ?? nil)
    }
    
    func test_fetchHomeData_WithServiceOnlineAndValidResponse_shouldReturnHomeData() throws {
        sut = .init(networkClient: NetworkClientMock(.success(homeDataJson)))
        let data = try XCTUnwrap(homeDataJson)
        let mock = getMock(data: data)
        
        var homeDataResult = [HomeData?]()
        
        sut.fetchHomeData { homeData in
            homeDataResult.append(homeData)
        }
        
        XCTAssertEqual(homeDataResult.count, 1)
        XCTAssertEqual(homeDataResult.first, mock)
    }
    
    func test_fetchHomeData_WithServiceOnlineAndEmptyResponse_shouldReturnHomeData() throws {
        let emptyJsonData = "".data(using: .utf8)
        sut = .init(networkClient: NetworkClientMock(.success(emptyJsonData)))
        let data = try XCTUnwrap("".data(using: .utf8))
        let mock = getMock(data: data)
        
        var homeDataResult = [HomeData?]()
        
        sut.fetchHomeData { homeData in
            homeDataResult.append(homeData)
        }
        
        XCTAssertEqual(homeDataResult.count, 1)
        XCTAssertEqual(homeDataResult.first, mock)
    }
    
    func test_fetchHomeData_WithServiceOnlineAndInvalidResponse_shouldReturnHomeData() throws {
        let emptyJsonData = "CONTEÚDO INVALIDO, NÃO É UM JSON".data(using: .utf8)
        sut = .init(networkClient: NetworkClientMock(.success(emptyJsonData)))
        let data = try XCTUnwrap("".data(using: .utf8))
        let mock = getMock(data: data)
        
        var homeDataResult = [HomeData?]()
        
        sut.fetchHomeData { homeData in
            homeDataResult.append(homeData)
        }
        
        XCTAssertEqual(homeDataResult.count, 1)
        XCTAssertEqual(homeDataResult.first, mock)
    }
    
    func test_fetchHomeData_WithServiceOnlineAndInvalidObject_shouldReturnHomeData() throws {
        let emptyJsonData = """
        {
          "balance": 15459.27
        }
        """.data(using: .utf8)
        sut = .init(networkClient: NetworkClientMock(.success(emptyJsonData)))
        let data = try XCTUnwrap("".data(using: .utf8))
        let mock = getMock(data: data)
        
        var homeDataResult = [HomeData?]()
        
        sut.fetchHomeData { homeData in
            homeDataResult.append(homeData)
        }
        
        XCTAssertEqual(homeDataResult.count, 1)
        XCTAssertEqual(homeDataResult.first, mock)
    }
}

// MARK: - Private methods

extension FinanceServiceTests {
    private func getMock(data: Data) -> HomeData? {
        do {
            let decoder = JSONDecoder()
            let mock = try decoder.decode(HomeData.self, from: data)
            return mock
        } catch {
            return nil
        }
    }
}

class NetworkClientMock: NetworkClientProtocol {
    
    enum NetworkClientMockStatus {
        case success(Data?)
        case error
    }
    
    var status: NetworkClientMockStatus?
    
    init(_ status: NetworkClientMock.NetworkClientMockStatus? = nil) {
        self.status = status
    }
    
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        guard let status = status else {
            completion(nil)
            return
        }
        
        switch status {
        case .success(let data):
            completion(data)
        case .error:
            completion(nil)
        }
    }
}
