import XCTest
@testable import FinanceApp

final class FinanceServiceTests: XCTestCase {
    typealias Sut = FinanceService
    
    func testfetchHomeData_URLValidation() throws {
        // given
        var urlReceived = [URL]()
        let (sut, fields) = try makeSut()
        fields.networkClient.performRequestImpl = { url, completion in
            urlReceived.append(url)
        }
        
        // when
        sut.fetchHomeData { _ in
            XCTFail("Não deveria ser chamado")
        }
        
        // then
        XCTAssertEqual(urlReceived, [fields.urlExpected])
    }
    
    func testfetchHomeData_WtihSuccess() throws {
        // given
        var homeDataReceived = [HomeData?]()
        let (sut, fields) = try makeSut()
        fields.networkClient.performRequestImpl = { _, completion in
            completion(homeDataJsonData)
        }
        
        // when
        sut.fetchHomeData { homeData in
            homeDataReceived.append(homeData)
        }
        
        // then
        XCTAssertEqual(homeDataReceived, [.fixture()])
    }
    
    func testfetchHomeData_WtihInvalidData() throws {
        // given
        var homeDataReceived = [HomeData?]()
        let (sut, fields) = try makeSut()
        fields.networkClient.performRequestImpl = { _, completion in
            completion(Data())
        }
        
        // when
        sut.fetchHomeData { homeData in
            homeDataReceived.append(homeData)
        }
        
        // then
        XCTAssertEqual(homeDataReceived.count, 1)
        XCTAssertNil(homeDataReceived[0])
    }
    
    func testfetchHomeData_WtihNullableData() throws {
        // given
        var homeDataReceived = [HomeData?]()
        let (sut, fields) = try makeSut()
        fields.networkClient.performRequestImpl = { _, completion in
            completion(nil)
        }
        
        // when
        sut.fetchHomeData { homeData in
            homeDataReceived.append(homeData)
        }
        
        // then
        XCTAssertEqual(homeDataReceived.count, 1)
        XCTAssertNil(homeDataReceived[0])
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
