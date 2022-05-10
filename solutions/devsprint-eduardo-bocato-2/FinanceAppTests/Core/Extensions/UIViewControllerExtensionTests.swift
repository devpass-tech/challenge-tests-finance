import XCTest
@testable import FinanceApp

final class UIViewControllerExtensionTests: XCTestCase {
    func test_insideNavigation_whenCalled_wrapsViewController() throws {
        //Given
        let sut = UIViewController()

        //When
        let result = sut.insideNavigationController()

        //Then
        XCTAssertTrue(result.modalPresentationStyle == .formSheet)
        XCTAssertEqual(result.viewControllers.count, 1)
        XCTAssertNotNil(result.viewControllers.first)
    }
}
