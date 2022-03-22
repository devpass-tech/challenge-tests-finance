import XCTest

class HttpClient {
    private(set) var requestsCallsCount = 0

    func request() {
        requestsCallsCount += 1
    }
}

class HomeService {
    private let httpClient: HttpClient

    init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }

    func getHome() {
        httpClient.request()
    }
}

class HomeServiceTests: XCTestCase {

    func test_initDoesNotPerformAnyRequest() {
        let httpClient = HttpClient()
        let _ = HomeService(httpClient: httpClient)

        XCTAssertEqual(httpClient.requestsCallsCount, 0)
    }

    func test_performsRequestOnGet() {
        let httpClient = HttpClient()
        let sut = HomeService(httpClient: httpClient)

        sut.getHome()

        XCTAssertEqual(httpClient.requestsCallsCount, 1)
    }
}
