import UIKit
import Combine

final class TransfersViewController: UIViewController {
    // MARK: - Properties
    
    private var subscriptions: Set<AnyCancellable> = .init()
    private let viewModel: TransfersViewModel
    
    // MARK: - UI
    
    private lazy var transferView: TransfersView = {
        let transferView = TransfersView()
        transferView.delegate = self
        return transferView
    }()
    
    // MARK: - Initialization
    
    init(viewModel: TransfersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func loadView() {
        view = transferView
        bindViewModel()
    }
    
    // MARK: - Setup
    
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
    
    // MARK: - Actions
    
    private func showConfirmationDialog() {
        let confirmationViewController = ConfirmationViewController()
        confirmationViewController.onConfirmationButtonTapped = {
            confirmationViewController.dismiss(animated: true)
        }
        present(confirmationViewController, animated: true)
    }
}

// MARK: - TransferViewDelegate
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
