import XCTest

@testable import FinanceApp

class InsideNavigationTests: XCTestCase {

    func test_insideNavigation_shouldReturn_CorrectConfiguration() {
        let dummyController = UIViewController()
        
        let sut = dummyController.insideNavigationController()
        
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.modalPresentationStyle, .formSheet)
        XCTAssertEqual(sut.viewControllers.count, 1)
        XCTAssertEqual(sut.viewControllers[0], dummyController)
    }
}
