import XCTest
import Core
import UIKit

@testable import FinanceApp

// Test Doubles

class HomeLoaderSpy: HomeLoader {
    var getHomeCallsCount: Int {
        completions.count
    }

    private(set) var completions: [(HomeLoader.Result) -> Void] = []

    func getHome(completion: @escaping (HomeLoader.Result) -> Void) {
        completions.append(completion)
    }

    func completeWithFailure(_ error: Error) {
        completions[0](.failure(error))
    }

    func completeWithSuccess(_ data: Home) {
        completions[0](.success(data))
    }
}

// Test

class HomeTableViewControllerTests: XCTestCase {
    func test_shouldRequestProperly() {
        let (sut, service) = makeSUT()

        XCTAssertEqual(service.getHomeCallsCount, 0)

        sut.render()

        XCTAssertEqual(service.getHomeCallsCount, 1)

        sut.pullToRefresh()

        XCTAssertEqual(service.getHomeCallsCount, 2)

        sut.pullToRefresh()

        XCTAssertEqual(service.getHomeCallsCount, 3)
    }

    func test_showLoadingOnRender() {
        let (sut, _) = makeSUT()

        sut.render()

        XCTAssertTrue(sut.isRefreshing)
    }

    func test_hideLoadingAfterFailure() {
        let (sut, service) = makeSUT()

        sut.render()
        service.completeWithFailure(anyError)

        XCTAssertFalse(sut.isRefreshing)
    }

    func test_showsErrorDialogOnFailure() {
        let (sut, service) = makeSUT()

        sut.render()
        service.completeWithFailure(anyError)

        XCTAssertEqual(sut.presentedError?.title, "Ops!")
        XCTAssertEqual(sut.presentedError?.message, "Algo de errado aconteceu. Tente novamente.")
        XCTAssertEqual(sut.presentedError?.preferredStyle, .alert)

        let actions = sut.presentedError?.actions

        XCTAssertEqual(actions?.count, 2)
        XCTAssertEqual(actions?[0].title, "Cancel")
        XCTAssertEqual(actions?[1].title, "Tentar novamente")
        XCTAssertEqual(actions?[0].style, .destructive)
        XCTAssertEqual(actions?[1].style, .default)
    }

    func test_showDataProperly() {
        let (sut, service) = makeSUT()

        XCTAssertEqual(sut.numberOfSections, 1)
        XCTAssertEqual(sut.numberOfLoadedItems, 0)

        sut.render()
        service.completeWithFailure(anyError)

        XCTAssertEqual(sut.numberOfSections, 1)
        XCTAssertEqual(sut.numberOfLoadedItems, 0)

        sut.pullToRefresh()
        service.completeWithSuccess(Home(balance: 123.5, savings: 0.9, spending: 12.05))

        expectToHaveValidTitles(for: sut)
        expectToHaveValidSectionAfterSucces(for: sut)
        expectThat(sut, hasBalance: "$123.50", savings: "$0.90", spending: "$12.05")

        sut.pullToRefresh()
        service.completeWithFailure(anyError)

        expectToHaveValidTitles(for: sut)
        expectToHaveValidSectionAfterSucces(for: sut)
        expectThat(sut, hasBalance: "$123.50", savings: "$0.90", spending: "$12.05")

        sut.pullToRefresh()
        service.completeWithSuccess(Home(balance: 0.15, savings: 56, spending: 26))

        expectToHaveValidTitles(for: sut)
        expectToHaveValidSectionAfterSucces(for: sut)
        expectThat(sut, hasBalance: "$0.15", savings: "$56.00", spending: "$26.00")
    }

    func test_doesNotShowErrorDialogOnSuccess() {
        let (sut, service) = makeSUT()

        sut.render()
        service.completeWithSuccess(Home(balance: 123, savings: 321, spending: 213))

        XCTAssertNil(sut.presentedError)
    }

    // MARK: Helpers

    private func expectToHaveValidTitles(for sut: TestableHomeTableViewController, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(sut.finance(at: 1)?.title, "Savings", file: file, line: line)
        XCTAssertEqual(sut.finance(at: 2)?.title, "Spending", file: file, line: line)
    }

    private func expectToHaveValidSectionAfterSucces(for sut: TestableHomeTableViewController, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(sut.numberOfSections, 1, file: file, line: line)
        XCTAssertEqual(sut.numberOfLoadedItems, 3, file: file, line: line)
    }

    private func expectThat(_ sut: TestableHomeTableViewController, hasBalance balance: String, savings: String, spending: String, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(sut.balance(at: 0)?.value, balance, file: file, line: line)
        XCTAssertEqual(sut.finance(at: 1)?.value, savings, file: file, line: line)
        XCTAssertEqual(sut.finance(at: 2)?.value, spending, file: file, line: line)
    }

    private var anyHomeData: Home {
        Home(balance: 123.5, savings: 0.9, spending: 12.05)
    }

    private var anyError: NSError {
        NSError(domain: UUID().uuidString, code: 0, userInfo: nil)
    }

    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (TestableHomeTableViewController, HomeLoaderSpy) {
        let service = HomeLoaderSpy()
        let sut = TestableHomeTableViewController(service: service)

        trackForMemoryLeak(sut, file: file, line: line)
        trackForMemoryLeak(service, file: file, line: line)

        return (sut, service)
    }

    private func trackForMemoryLeak(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {

        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
        }
    }
}

extension FinanceCell {
    var title: String? {
        titleLabel.text
    }

    var value: String? {
        valueLabel.text
    }
}

extension BalanceCell {
    var value: String? {
        valueLabel.text
    }
}

class TestableHomeTableViewController: HomeTableViewController {
    private(set) var presentedViewControllers: [UIViewController] = []

    private let firstSection = 0

    var isRefreshing: Bool {
        refreshControl?.isRefreshing == true
    }

    var presentedError: UIAlertController? {
        presentedViewControllers.last as? UIAlertController
    }

    func render() {
        beginAppearanceTransition(true, animated: false)
    }

    func pullToRefresh() {
        refreshControl?.sendActions(for: .valueChanged)
    }

    func balance(at row: Int) -> BalanceCell? {
        cell(at: row) as? BalanceCell
    }

    func finance(at row: Int) -> FinanceCell? {
        cell(at: row) as? FinanceCell
    }

    var numberOfLoadedItems: Int {
        tableView(tableView, numberOfRowsInSection: firstSection)
    }

    var numberOfSections: Int {
        numberOfSections(in: tableView)
    }

    private func cell(at row: Int) -> UITableViewCell {
        tableView(tableView, cellForRowAt: IndexPath(row: row, section: firstSection))
    }

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentedViewControllers.append(viewControllerToPresent)
    }
}
