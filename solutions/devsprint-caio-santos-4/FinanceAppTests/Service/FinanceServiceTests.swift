//
//  FinanceServiceTests.swift
//  FinanceAppTests
//
//  Created by Vinicius dos Reis Morgado Brancalliao on 13/06/22.
//

import XCTest
@testable import FinanceApp

final class FinanceServiceTests: XCTestCase {
    var sut: FinanceService!
    
    override func tearDown() {
        sut = nil
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
        let mock = getMock(data: data)
        var userProfileResult = [UserProfile?]()
        
        sut.fetchUserProfile { userProfile in
            userProfileResult.append(userProfile)
        }
        
        XCTAssertEqual(userProfileResult.count, 1)
        XCTAssertEqual(userProfileResult.first, mock)
    }
    
    func test_fetchUserProfile_whenServiceOnlineAndEmptyResponse_shouldReturnUserProfile() throws {
        sut = .init(networkClient: NetworkClientMock(.success("".data(using: .utf8))))
        let data = try XCTUnwrap("".data(using: .utf8))
        let mock = getMock(data: data)
        var userProfileResult = [UserProfile?]()
        
        sut.fetchUserProfile { userProfile in
            userProfileResult.append(userProfile)
        }
        
        XCTAssertEqual(userProfileResult.count, 1)
        XCTAssertEqual(userProfileResult.first, mock)
    }
}

extension FinanceServiceTests {
    private func getMock(data: Data) -> UserProfile? {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let mock = try decoder.decode(UserProfile.self, from: data)
            return mock
        } catch {
            return nil
        }
    }
}

class NetworkClientMock: NetworkClientProtocol {
    enum NetworkClientStatus {
        case success(Data?)
        case error
    }
    
    var status: NetworkClientStatus?
    
    init(_ status: NetworkClientMock.NetworkClientStatus? = nil) {
        self.status = status
    }
    
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        guard let status = status else {
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
