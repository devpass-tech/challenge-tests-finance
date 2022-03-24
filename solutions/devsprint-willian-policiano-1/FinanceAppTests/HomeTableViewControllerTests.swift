import XCTest
import Core

// SUT

class HomeTableViewController {
    init(service: HomeLoader) {

    }
}

// Test Doubles

class HomeLoaderSpy: HomeLoader {
    var getHomeCallsCount: Int {
        completions.count
    }

    private(set) var completions: [(HomeLoader.Result) -> Void] = []

    func getHome(completion: @escaping (HomeLoader.Result) -> Void) {
        completions.append(completion)
    }
}

// Test

class HomeTableViewControllerTests: XCTestCase {
    func test_initShouldNotPerformAnyRequest() {
        let (_, service) = makeSUT()

        XCTAssertEqual(service.getHomeCallsCount, 0)
    }

    func makeSUT() -> (HomeTableViewController, HomeLoaderSpy) {
        let service = HomeLoaderSpy()
        let sut = HomeTableViewController(service: service)

        return (sut, service)
    }
}
