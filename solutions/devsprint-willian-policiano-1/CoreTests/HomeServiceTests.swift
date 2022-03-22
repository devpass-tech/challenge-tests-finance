import XCTest

class HttpClient {
    private(set) var requestsCallsCount = 0
    private(set) var urls: [URL] = []

    func request(url: URL) {
        requestsCallsCount += 1
        urls.append(url)
    }
}

class HomeService {
    private let httpClient: HttpClient

    init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }

    func getHome() {
        httpClient.request(url: URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json")!)
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

    func test_sendsUrlOnRequest() {
        let httpClient = HttpClient()
        let sut = HomeService(httpClient: httpClient)

        sut.getHome()

        XCTAssertEqual(httpClient.urls, [URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json")!])
    }
}
