import XCTest
@testable import FinanceApp

class InsideNavigationTests: XCTestCase {
    private let dummyController = UIViewController()

    func test_insideNavigation_should_NotBeNil() {
        let sut = dummyController.insideNavigationController()
        XCTAssertNotNil(sut)
    }
    
    func test_insideNavigation_shouldPresent_withModalFormSheetPresentationStyle() {
        let sut = dummyController.insideNavigationController()
        XCTAssertEqual(sut.modalPresentationStyle, .formSheet)
    }
    
    func test_insideNavigation_shouldContains_viewController() {
        let sut = dummyController.insideNavigationController()
        XCTAssertEqual(sut.viewControllers.first, dummyController)
    }
    
    func test_insideNavigation_shouldHave_oneViewController() {
        let sut = dummyController.insideNavigationController()
        XCTAssertEqual(sut.viewControllers.count, 1)
    }
}
