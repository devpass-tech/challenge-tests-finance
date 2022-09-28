
import XCTest

@testable import FinanceApp

final class TransfersViewControllerTests: XCTestCase {
    
    private let sut = TransfersViewController()
    
    func test_didPressChooseContactButton_contactListViewControllerToPresent() {
        
        makeWindow(with: sut)
        sut.didPressChooseContactButton()
        
        XCTAssertTrue(sut.viewControllerToPresent() is ContactListViewController)
    }
    
    func test_didPressChooseContactButton_confirmationViewControllerToPresent() {
        
        makeWindow(with: sut)
        sut.didPressTransferButton()
        
        XCTAssertTrue(sut.viewControllerToPresent() is ConfirmationViewController)
    }
}

extension TransfersViewControllerTests {
    
    func makeWindow(with rootViewController: UIViewController) {
        let window = UIWindow()
        window.rootViewController = rootViewController
        window.isHidden = false
    }
}

extension UIViewController {
    
    func viewControllerToPresent() -> UIViewController? {
        let navController = self.presentedViewController as? UINavigationController
        return navController?.topViewController
    }
}
