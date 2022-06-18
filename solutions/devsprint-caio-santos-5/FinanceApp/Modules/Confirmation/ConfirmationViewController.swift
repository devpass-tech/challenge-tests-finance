import UIKit

final class ConfirmationViewController: UIViewController {
    lazy var root = ConfirmationView()
    
    override func loadView() {
        self.view = root
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        root.confirmationButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
    }
    
    @objc func dismissAction() {
        dismiss(animated: true)
    }
}
