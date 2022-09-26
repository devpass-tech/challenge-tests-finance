
import XCTest

@testable import FinanceApp

final class FinanceServiceTests: XCTestCase {
    private let networkClientSpy = NetworkClientSpy()
    private lazy var sut = FinanceService(networkClient: networkClientSpy)
    private let correctData =
    """
    {
        "name": "Irma Flores",
        "phone": "+55 (11) 99999-9999",
        "email": "irma@devpass.com.br",
        "address": "Rua Bela Cintra, 495",
        "account": {
            "agency": "0001",
            "account": "123456-7"
        }
    }
    """.data(using: .utf8)

    private let incorrectData =
    """
    """.data(using: .utf8)
    
    func test_fetchUserProfile_shouldSendCorrectURL() {
        sut.fetchUserProfile { _ in }
        XCTAssertEqual(networkClientSpy.performRequestCount, 1)
        XCTAssertEqual(networkClientSpy.url?.description, "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/user_profile_endpoint.json")
    }
    
    func test_fetchUserProfile_givenNilData_shouldReturnNil() {
        networkClientSpy.completionData = nil
        var expectedData: UserProfile?

        sut.fetchUserProfile { data in
            expectedData = data
        }

        XCTAssertEqual(networkClientSpy.performRequestCount, 1)
        XCTAssertNil(expectedData)
    }

    func test_fetchUserProfile_givenData_shouldReturnCorrectUserProfile() {
        networkClientSpy.completionData = correctData
        var expectedData: UserProfile?

        sut.fetchUserProfile { data in
            expectedData = data
        }

        XCTAssertEqual(expectedData, .fixture())
    }

    func test_fetchUserProfile_givenDataWithFailureParse_shouldReturnCorrectUserProfile() {
        networkClientSpy.completionData = incorrectData
        var expectedData: UserProfile?

        sut.fetchUserProfile { data in
            expectedData = data
        }

        XCTAssertNil(expectedData)
    }
}
