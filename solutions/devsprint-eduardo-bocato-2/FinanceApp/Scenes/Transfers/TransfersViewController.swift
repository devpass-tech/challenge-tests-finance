import UIKit

final class TransfersViewController: UIViewController {
    private lazy var transferView: TransfersView = {
        let transferView = TransfersView()
        transferView.delegate = self
        return transferView
    }()

    override func loadView() {
        view = transferView
    }
}

extension TransfersViewController: TransferViewDelegate {
    func didPressChooseContactButton() {
        let navigationController = UINavigationController(rootViewController: ContactListViewController())
        present(navigationController, animated: true)
    }

    func didPressTransferButton() {
        let navigationController = UINavigationController(rootViewController: ConfirmationViewController())
        present(navigationController, animated: true)
    }
}
