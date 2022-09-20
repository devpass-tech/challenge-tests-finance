import XCTest

@testable import FinanceApp


final class UIViewControllerExtensionsTests:XCTestCase {
    private let sut = UIViewController()
    
    
    func test_insideNavigationController_shouldReturnNavigationController(){
        
        let navigationController =  sut.insideNavigationController()
        
        
        XCTAssertNotNil(navigationController)
        XCTAssertEqual(navigationController.topViewController, sut)
        XCTAssertEqual(navigationController.modalPresentationStyle, .formSheet)
        
    }
}
