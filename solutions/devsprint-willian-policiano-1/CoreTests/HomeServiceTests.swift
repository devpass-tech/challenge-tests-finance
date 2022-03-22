import XCTest

class HttpClient {
    var requestsCallsCount = 0
}

class HomeService {
    init(httpClient: HttpClient) {

    }
}

class HomeServiceTests: XCTestCase {

    func test_initDoesNotPerformAnyRequest() {
        let httpClient = HttpClient()
        let _ = HomeService(httpClient: httpClient)

        XCTAssertEqual(httpClient.requestsCallsCount, 0)
    }
}
