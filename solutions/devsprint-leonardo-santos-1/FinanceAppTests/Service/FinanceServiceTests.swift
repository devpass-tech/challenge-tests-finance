import XCTest
@testable import FinanceApp

class FinanceServiceTests: XCTestCase {

    private let networkSpy = NetworkSpy()
    private lazy var sut = FinanceService(networkClient: networkSpy)

    func test_fetchUserProfile_givenUrl_shouldCallNetworkClientToPerformRequest() {
        //given

        //when
        sut.fetchUserProfile { _ in

            //then
            XCTAssertEqual(self.networkSpy.performRequestCount, 1)
        }
    }

    func test_fetchUserProfile_whenDataIsNil_shouldCallCompletionNil() {

        //given
        networkSpy.data = nil

        //when
        sut.fetchUserProfile { data in

            //then
            XCTAssertEqual(nil, data)
        }
    }

    func test_fetchUserProfile_whenDataIsInvalid_shouldCallCompletionNil() {

        //given
        let invalidData = Data("invalid string".utf8)
        networkSpy.data = invalidData

        //when
        sut.fetchUserProfile { data in

            //then
            XCTAssertEqual(nil, data)
        }

    }

    func test_fetchUserProfile_whenDataIsValid_shouldCallCompletionWithModel() {
        //given
        let validData = Data(Constants.json.utf8)
        networkSpy.data = validData

        //when
        sut.fetchUserProfile { data in

            //then
            XCTAssertEqual(Constants.user, data)
        }
    }

}

extension FinanceServiceTests {
    enum Constants {
        static let json = """
{
    "name": "Emanuel",
    "phone": "2352352",
    "email": "2352352",
    "address": "rua 1233",
    "account": {
        "agency": "agencia 123",
        "account": "gaifea"
    }
}
"""
        static let user = UserProfile(name: "Emanuel", phone: "2352352", email: "2352352", address: "rua 1233", account: Account(agency: "agencia 123", account: "gaifea"))
    }
}
