import XCTest
@testable import FinanceApp

final class FinanceServiceTests: XCTestCase {
    typealias Sut = FinanceService
    
    func test_FetchHomeData_URLValidation() throws {
        // given
        var callOrder = [String]()
        let (sut, fields) = try makeSut()
        fields.networkClient.performRequestImpl = { url, _ in
            XCTAssertEqual(url, fields.urlExpected)
            callOrder.append("performRequest called")
        }
        
        // when
        sut.fetchHomeData { _ in
            callOrder.append("fetchHomeData não deveria ser chamado")
        }
        
        // then
        XCTAssertEqual(callOrder, ["performRequest called"])
    }
    
    func test_FetchHomeData_WithSuccess() throws {
        // given
        var callOrder = [String]()
        let (sut, fields) = try makeSut()
        fields.networkClient.performRequestImpl = { _, completion in
            callOrder.append("performRequest called")
            completion(homeDataJsonData)
        }
        
        // when
        sut.fetchHomeData { homeData in
            callOrder.append("fetchHomeData called")
            XCTAssertEqual(homeData, .fixture())
        }
        
        // then
        XCTAssertEqual(callOrder, [
            "performRequest called",
            "fetchHomeData called"
        ])
    }
    
    func test_FetchHomeData_WithInvalidData() throws {
        // given
        var callOrder = [String]()
        let (sut, fields) = try makeSut()
        fields.networkClient.performRequestImpl = { _, completion in
            callOrder.append("performRequest called")
            completion(Data())
        }
        
        // when
        sut.fetchHomeData { homeData in
            callOrder.append("fetchHomeData called")
            XCTAssertNil(homeData)
        }
        
        // then
        XCTAssertEqual(callOrder, [
            "performRequest called",
            "fetchHomeData called"
        ])
    }
    
    func test_FetchHomeData_WithNullableData() throws {
        // given
        var callOrder = [String]()
        let (sut, fields) = try makeSut()
        fields.networkClient.performRequestImpl = { _, completion in
            callOrder.append("performRequest called")
            completion(nil)
        }
        
        // when
        sut.fetchHomeData { homeData in
            callOrder.append("fetchHomeData called")
            XCTAssertNil(homeData)
        }
        
        // then
        XCTAssertEqual(callOrder, [
            "performRequest called",
            "fetchHomeData called"
        ])
    }
    
    func makeSut() throws -> (sut: Sut, (networkClient: NetworkClientMock, urlExpected: URL)) {
        let networkClient = NetworkClientMock()
        let sut = Sut(networkClient: networkClient)
        let urlExpected = try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json"))
        return (sut, (networkClient, urlExpected))
    }
}

extension HomeData {
    static func fixture(
        balance: Float = 15459.27,
        savings: Float = 1000,
        spending: Float = 500,
        activity: [Activity] = [.fixture()]
    ) -> HomeData {
        .init(
            balance: balance,
            savings: savings,
            spending: spending,
            activity: activity
        )
    }
}

extension Activity {
    static func fixture(
        name: String = "Mall",
        price: Float = 100,
        time: String = "8:57 AM"
    ) -> Activity {
        .init(
            name: name,
            price: price,
            time: time
        )
    }
}

final class NetworkClientMock: NetworkClientProtocol {
    var performRequestImpl: (_ url: URL, _ completion: @escaping (Data?) -> ()) -> Void = { _, _ in
        XCTFail("performRequestImpl não foi implementada")
    }
    
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        performRequestImpl(url, completion)
    }
}
