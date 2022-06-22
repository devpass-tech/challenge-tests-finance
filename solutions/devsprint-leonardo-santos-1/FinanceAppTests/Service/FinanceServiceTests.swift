import XCTest
@testable import FinanceApp

class FinanceServiceTests: XCTestCase {

    func testFetchUserProfile() {
        //given
        let networkSpy = NetworkSpy()
        let financeService = FinanceService(networkClient: networkSpy)

        //when
        financeService.fetchUserProfile { _ in

            //then
            XCTAssertEqual(networkSpy.performRequestCount, 1)
        }
    }

    func testFetchUserProfileReturning() {
        //given
        let networkMock = NetworkMock()
        let financeService = FinanceService(networkClient: networkMock)
        let userModel = NetworkMock.getUser()

        //when
        financeService.fetchUserProfile { data in

            //then
            XCTAssertEqual(userModel, data)
        }
    }

}

class NetworkSpy: NetworkClientProtocol {
    var performRequestCount = 0

    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        performRequestCount += 1
        completion(nil)
    }
}

class NetworkMock: NetworkClientProtocol {


    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let model = NetworkMock.getUser()
        let endodedModel = try? JSONEncoder().encode(model)
        completion(endodedModel)
    }

    static func getUser() -> UserProfile {
        let account = Account(agency: "agencia 01", account: "conta 03")
        let user = UserProfile(name: "Pedro",
                               phone: "555555",
                               email: "a@a.com",
                               address: "av 123 baurro 5",
                               account: account)
        return user
    }
}
