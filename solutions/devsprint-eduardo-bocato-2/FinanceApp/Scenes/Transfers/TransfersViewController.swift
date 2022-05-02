import UIKit
import Combine

final class TransfersViewController: UIViewController {
    private var subscriptions: Set<AnyCancellable> = .init()
    private let viewModel = TransfersViewModel()
    
    private lazy var transferView: TransfersView = {
        let transferView = TransfersView()
        transferView.delegate = self
        return transferView
    }()

    override func loadView() {
        view = transferView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.$state
            .map(\.amountToTransfer)
            .removeDuplicates()
            .receive(on: RunLoop.main)
            .assign(to: \.amountText, on: transferView)
            .store(in: &subscriptions)
        
        viewModel.$state
            .map(\.canExecuteTransfer)
            .receive(on: RunLoop.main)
            .assign(to: \.isTransferButtonEnabled, on: transferView)
            .store(in: &subscriptions)
        
        viewModel.$state
            .map(\.transferRequestSuceeded)
            .removeDuplicates()
            .receive(on: RunLoop.main)
            .sink(
                receiveValue: { [weak self] in
                    if $0 { self?.showConfirmationDialog() }
                }
            )
            .store(in: &subscriptions)
    }
    
    private func showConfirmationDialog() {
        let confirmationViewController = ConfirmationViewController()
        confirmationViewController.onConfirmationButtonTapped = {
            confirmationViewController.dismiss(animated: true)
        }
        present(confirmationViewController, animated: true)
    }
}

extension TransfersViewController: TransferViewDelegate {
    func didPressChooseContactButton() {
        let navigationController = UINavigationController(
            rootViewController: ContactListViewController(
                onSelectedContact: { [viewModel] selectedContact in
                    viewModel.selectContact(selectedContact)
                }
            )
        )
        present(navigationController, animated: true)
    }

    func didPressTransferButton() {
        viewModel.executeTransfer()
    }
    
    func amountTextChanged(_ text: String?) {
        viewModel.updateAmountToTransfer(text)
    }
}
