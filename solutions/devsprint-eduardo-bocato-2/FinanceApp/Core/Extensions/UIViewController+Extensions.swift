import UIKit

extension UIViewController {
    func insideNavigationController() -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: self)
        navigationController.modalPresentationStyle = .formSheet
        return navigationController
    }
}
