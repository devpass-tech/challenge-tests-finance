import UIKit

final class ConfirmationViewController: UIViewController {
    var onConfirmationButtonTapped: (() -> Void)?
    override func loadView() {
        view = ConfirmationView(onConfirmationButtonTapped: onConfirmationButtonTapped)
    }
}
