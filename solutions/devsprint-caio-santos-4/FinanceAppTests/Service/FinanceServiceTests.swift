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
    private var sut: FinanceService!

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
        let mock: HomeData? = getMock(data: data)
        
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
        let mock: HomeData? = getMock(data: data)
        
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
        let mock: HomeData? = getMock(data: data)
        
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
        let mock: HomeData? = getMock(data: data)
        
        var homeDataResult = [HomeData?]()
        
        sut.fetchHomeData { homeData in
            homeDataResult.append(homeData)
        }
        
        XCTAssertEqual(homeDataResult.count, 1)
        XCTAssertEqual(homeDataResult.first, mock)
    }
    // MARK: - Transfer Amount
    func testTransferAmount_whenServiceDown_shouldReturnNil() {

        sut = .init(networkClient: NetworkClientMock(.error))
        sut.transferAmount { transferResult in
            XCTAssertNil(transferResult)
        }
    }

    func testTransferAmount_whenServiceOnlineAndValidResponse_shouldReturnResult() {

        sut = .init(networkClient: NetworkClientMock(.success(transferAmountJson)))
        sut.transferAmount { transferResult in
            XCTAssertEqual(transferResult?.success, true)
        }
    }

    func testTransferAmount_whenServiceOnlineAndInvalidResponse_shouldReturnResult() {

        let invalidResponse = "invalid json".data(using: .utf8)
        sut = .init(networkClient: NetworkClientMock(.success(invalidResponse)))
        sut.transferAmount { transferResult in
            XCTAssertNil(transferResult)
        }
    }
    
    func test_fetchUserProfile_whenServiceDown_shouldReturnNil() {
        sut = .init(networkClient: NetworkClientMock(.error))
        var userProfileResult = [UserProfile?]()

        sut.fetchUserProfile { userProfile in
            userProfileResult.append(userProfile)
        }

        XCTAssertEqual(userProfileResult.count, 1)
        XCTAssertNil(userProfileResult.first ?? nil)
    }

    func test_fetchUserProfile_whenServiceOnlineAndValidResponse_shouldReturnUserProfile() throws {
        sut = .init(networkClient: NetworkClientMock(.success(userProfileJson)))
        let data = try XCTUnwrap(userProfileJson)
        let mock: UserProfile? = getMock(data: data)
        var userProfileResult = [UserProfile?]()

        sut.fetchUserProfile { userProfile in
            userProfileResult.append(userProfile)
        }

        XCTAssertEqual(userProfileResult.count, 1)
        XCTAssertEqual(userProfileResult.first ?? nil, mock)
    }

    func test_fetchUserProfile_whenServiceOnlineAndEmptyResponse_shouldReturnUserProfile() throws {
        sut = .init(networkClient: NetworkClientMock(.success("".data(using: .utf8))))
        let data = try XCTUnwrap("".data(using: .utf8))
        let mock: UserProfile? = getMock(data: data)
        var userProfileResult = [UserProfile?]()

        sut.fetchUserProfile { userProfile in
            userProfileResult.append(userProfile)
        }

        XCTAssertEqual(userProfileResult.count, 1)
        XCTAssertEqual(userProfileResult.first!, mock)
    }
}
// MARK: - Private methods

extension FinanceServiceTests {
    private func getMock<T: Decodable>(data: Data) -> T? {
        do {
            let decoder = JSONDecoder()
            let mock = try decoder.decode(T.self, from: data)
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
