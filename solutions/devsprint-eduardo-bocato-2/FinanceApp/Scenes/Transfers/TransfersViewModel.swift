import Foundation
import Combine

struct TransfersState: Equatable {
    var amountToTransfer: String?
    var selectedContact: Contact?
    var canExecuteTransfer: Bool = false
    var transferRequestSuceeded: Bool = false
}

struct TransfersEnvironment {
    var transferAmountUseCase: TransferMoneyUseCase
}
extension TransfersEnvironment {
    static let live: Self = .init(
        transferAmountUseCase: .live()
    )
}

final class TransfersViewModel: ObservableObject {
    @Published private(set) var state: TransfersState
    private let environment: TransfersEnvironment
    
    private var subscriptions: Set<AnyCancellable> = .init()
    
    init(
        initialState: TransfersState = .init(),
        environment: TransfersEnvironment = .live
    ) {
        self.state = initialState
        self.environment = environment
    }
    
    func updateAmountToTransfer(_ newValue: String?) {
        state.amountToTransfer = newValue
        updateTransferButtonState()
    }
    
    func selectContact(_ contact: Contact) {
        state.selectedContact = contact
        updateTransferButtonState()
    }
    
    func executeTransfer() {
        state.transferRequestSuceeded = false
        
        guard
            let amountToTranfer = state.amountToTransfer,
            state.canExecuteTransfer
        else { return }
        
        environment
            .transferAmountUseCase
            .execute(amountToTranfer)
            .replaceError(with: false)
            .sink(
                receiveValue: { [weak self] result in
                    self?.state.transferRequestSuceeded = result
                }
            )
            .store(in: &subscriptions)
    }
    
    private func updateTransferButtonState() {
        state.canExecuteTransfer = state.amountToTransfer?.isEmpty == false && state.selectedContact != nil
    }
}
