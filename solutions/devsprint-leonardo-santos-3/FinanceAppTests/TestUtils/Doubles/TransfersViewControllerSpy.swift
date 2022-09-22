
import UIKit

@testable import FinanceApp

final class TransfersViewControllerSpy: TransfersViewController {
    
    // MARK: - Properties
    
    private(set) var viewControllerToPresent: UIViewController?
    
    // MARK: - Methods
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        let navigationController = viewControllerToPresent as? UINavigationController
        self.viewControllerToPresent = navigationController?.topViewController
    }
}
