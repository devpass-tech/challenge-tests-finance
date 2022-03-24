import XCTest
import Core
import UIKit

// SUT

class HomeTableViewController: UITableViewController {
    init(service: HomeLoader) {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        refreshControl = UIRefreshControl()
        refreshControl?.beginRefreshing()
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

    func test_showLoadingOnRender() {
        let (sut, _) = makeSUT()

        sut.beginAppearanceTransition(true, animated: false)

        XCTAssertEqual(sut.refreshControl?.isRefreshing, true)
    }

    func makeSUT() -> (HomeTableViewController, HomeLoaderSpy) {
        let service = HomeLoaderSpy()
        let sut = HomeTableViewController(service: service)

        return (sut, service)
    }
}
