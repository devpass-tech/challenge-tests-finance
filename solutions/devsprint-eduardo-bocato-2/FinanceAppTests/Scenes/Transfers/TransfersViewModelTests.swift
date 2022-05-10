import XCTest
import Combine
@testable import FinanceApp

final class TransfersViewModelTests: XCTestCase {

    func test_updateAmountToTransfer_whenValueEmpty_shouldNotExecuteTransfer() {
        // Given
        let sut = TransfersViewModel(initialState: .init(), environment: TransfersEnvironment.mocking())

        // When
        sut.updateAmountToTransfer("")

        // Then
        XCTAssertFalse(sut.state.canExecuteTransfer)
        XCTAssertTrue(sut.state.amountToTransfer?.isEmpty ?? false)
    }

    func test_updateAmountToTransfer_whenHasValueAndContact_shouldLetExecuteTransfer() {
        // Given
        let sut = TransfersViewModel(initialState: .init(), environment: TransfersEnvironment.mocking())

        // When
        sut.updateAmountToTransfer("123")
        sut.selectContact(Contact.fixture())

        // Then
        XCTAssertTrue(sut.state.canExecuteTransfer)
        XCTAssertNotNil(sut.state.selectedContact)
    }

    func test_selectContact_whenContactIsNotSelected_shouldNotExecuteTransfer() {
        // Given
        let sut = TransfersViewModel(initialState: .init(), environment: TransfersEnvironment.mocking())

        // When
        // If state is not changed, contact is nil

        // Then
        XCTAssertFalse(sut.state.canExecuteTransfer)
        XCTAssertNil(sut.state.selectedContact)

    }

    func test_executeTransfer_whenStateCantExecuteTransfer_shouldNotTransfer() {
        // Given
        let sut: TransfersViewModel = .init(
            initialState: .init(),
            environment: .mocking(
                transferAmountUseCase: .stub(returning: .success(false))
            )
        )

        let collector = PublisherCollector<TransfersState, Never>()
        collector.collect(from: sut.$state.eraseToAnyPublisher())

        // When
        sut.executeTransfer()

        // Then

        let expectedStates: [TransfersState] = [
            .init(amountToTransfer: nil, selectedContact: nil, canExecuteTransfer: false, transferRequestSuceeded: false),
            .init(amountToTransfer: nil, selectedContact: nil, canExecuteTransfer: false, transferRequestSuceeded: false)
        ]

        XCTAssertEqual(expectedStates, collector.values)
    }

//    func test_executeTransfer_whenStateCanExecuteTransferAndWithoutAmountToTransfer_shouldNotTransfer() {
//        // Given
//        let transferStub: TransfersServiceStub = .init()
//        transferStub.transferAmountResultToBeReturned = TransferResult.fixture()
//        let sut = TransfersViewModel.mocking(transferService: transferStub)
//
//        sut.selectContact(Contact.fixture())
//
//        let collector = PublisherCollector<TransfersState, Never>()
//        collector.collect(from: sut.$state.eraseToAnyPublisher())
//
//        // When
//        sut.executeTransfer()
//
//        // Then
//
//        let expectedStates: [TransfersState] = [
//            .init(amountToTransfer: nil, selectedContact: Contact.fixture(), canExecuteTransfer: false, transferRequestSuceeded: false),
//            .init(amountToTransfer: nil, selectedContact: Contact.fixture(), canExecuteTransfer: false, transferRequestSuceeded: false),
//        ]
//
//        XCTAssertEqual(expectedStates, collector.values)
//    }
//
//    func test_executeTransfer_whenHasAmountToTransferAndStateCanExecuteTransfer_shouldTransfer() {
//        // Given
//        let transferStub: TransfersServiceStub = .init()
//        transferStub.transferAmountResultToBeReturned = TransferResult.fixture()
//        let sut = TransfersViewModel.mocking(transferService: transferStub)
//
//
//        sut.updateAmountToTransfer("123")
//        sut.selectContact(Contact.fixture())
//
//        let collector = PublisherCollector<TransfersState, Never>()
//        collector.collect(from: sut.$state.eraseToAnyPublisher())
//
//        // When
//        sut.executeTransfer()
//
//        // Then
//
//        let expectedStates: [TransfersState] = [
//            .init(amountToTransfer: "123", selectedContact: Contact.fixture(), canExecuteTransfer: true, transferRequestSuceeded: false),
//            .init(amountToTransfer: "123", selectedContact: Contact.fixture(), canExecuteTransfer: true, transferRequestSuceeded: false),
//            .init(amountToTransfer: "123", selectedContact: Contact.fixture(), canExecuteTransfer: true, transferRequestSuceeded: true),
//        ]
//
//        XCTAssertEqual(expectedStates, collector.values)
//    }
}
