import XCTest
import Combine
@testable import FinanceApp

final class TransfersViewModelTests: XCTestCase {

    func test_updateAmountToTransfer_whenValueEmpty_shouldNotExecuteTransfer() {
        // Given
        let dummyUseCase: TransferMoneyUseCase = .instantiate(transferService: TransfersServiceDummy())
        let dummyEnvironment: TransfersEnvironment = .init(transferAmountUseCase: dummyUseCase)
        let sut = TransfersViewModel(initialState: .init(), environment: dummyEnvironment)

        // When
        sut.updateAmountToTransfer("")

        // Then
        XCTAssertFalse(sut.state.canExecuteTransfer)
        XCTAssertTrue(sut.state.amountToTransfer?.isEmpty ?? false)
    }

    func test_updateAmountToTransfer_whenHasValueAndContact_shouldLetExecuteTransfer() {
        // Given
        let dummyUseCase: TransferMoneyUseCase = .instantiate(transferService: TransfersServiceDummy())
        let dummyEnvironment: TransfersEnvironment = .init(transferAmountUseCase: dummyUseCase)
        let sut = TransfersViewModel(initialState: .init(), environment: dummyEnvironment)

        // When
        sut.updateAmountToTransfer("123")
        sut.selectContact(Contact.fixture())

        // Then
        XCTAssertTrue(sut.state.canExecuteTransfer)
        XCTAssertNotNil(sut.state.selectedContact)
    }

    func test_selectContact_whenContactIsNotSelected_shouldNotExecuteTransfer() {
        // Given
        let dummyUseCase: TransferMoneyUseCase = .instantiate(transferService: TransfersServiceDummy())
        let dummyEnvironment: TransfersEnvironment = .init(transferAmountUseCase: dummyUseCase)
        let sut = TransfersViewModel(initialState: .init(), environment: dummyEnvironment)

        // When
        // If state is not changed, contact is nil

        // Then
        XCTAssertFalse(sut.state.canExecuteTransfer)
        XCTAssertNil(sut.state.selectedContact)

    }

    func test_executeTransfer_whenStateCantExecuteTransfer_shouldNotTransfer() {
        let transferStub: TransfersServiceStub = .init()
        transferStub.transferAmountResultToBeReturned = TransferResult.fixture()
        let dummyUseCase: TransferMoneyUseCase = .instantiate(transferService: transferStub)
        let dummyEnvironment: TransfersEnvironment = .init(transferAmountUseCase: dummyUseCase)
        let sut = TransfersViewModel(initialState: .init(), environment: dummyEnvironment)

        var cancellables: Set<AnyCancellable> = []
        var collectedStates: [TransfersState] = []

        let objectWillChangeCompletionExpectation = expectation(description: "objectWillChangeCompletionExpectation")
        objectWillChangeCompletionExpectation.expectedFulfillmentCount = 2

        sut.$state
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { newState in
                    collectedStates.append(newState)
                    objectWillChangeCompletionExpectation.fulfill()
                }
            ).store(in: &cancellables)

        // When
        sut.executeTransfer()

        // Then
        wait(for: [objectWillChangeCompletionExpectation], timeout: 1.0)

        let expectedStates: [TransfersState] = [
            .init(amountToTransfer: nil, selectedContact: nil, canExecuteTransfer: false, transferRequestSuceeded: false),
            .init(amountToTransfer: nil, selectedContact: nil, canExecuteTransfer: false, transferRequestSuceeded: false)
        ]

        XCTAssertEqual(expectedStates, collectedStates)
    }

    func test_executeTransfer_whenStateCanExecuteTransferAndWithoutAmountToTransfer_shouldNotTransfer() {
        // Given
        let transferStub: TransfersServiceStub = .init()
        transferStub.transferAmountResultToBeReturned = TransferResult.fixture()
        let dummyUseCase: TransferMoneyUseCase = .instantiate(transferService: transferStub)
        let dummyEnvironment: TransfersEnvironment = .init(transferAmountUseCase: dummyUseCase)
        let sut = TransfersViewModel(initialState: .init(), environment: dummyEnvironment)

        sut.selectContact(Contact.fixture())

        var cancellables: Set<AnyCancellable> = []
        var collectedStates: [TransfersState] = []

        let objectWillChangeCompletionExpectation = expectation(description: "objectWillChangeCompletionExpectation")
        objectWillChangeCompletionExpectation.expectedFulfillmentCount = 2

        sut.$state
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { newState in
                    collectedStates.append(newState)
                    objectWillChangeCompletionExpectation.fulfill()
                }
            ).store(in: &cancellables)

        // When
        sut.executeTransfer()

        // Then
        wait(for: [objectWillChangeCompletionExpectation], timeout: 1.0)

        let expectedStates: [TransfersState] = [
            .init(amountToTransfer: nil, selectedContact: Contact.fixture(), canExecuteTransfer: false, transferRequestSuceeded: false),
            .init(amountToTransfer: nil, selectedContact: Contact.fixture(), canExecuteTransfer: false, transferRequestSuceeded: false),
        ]

        XCTAssertEqual(expectedStates, collectedStates)
    }

    func test_executeTransfer_whenHasAmountToTransferAndStateCanExecuteTransfer_shouldTransfer() {
        // Given
        let transferStub: TransfersServiceStub = .init()
        transferStub.transferAmountResultToBeReturned = TransferResult.fixture()
        let dummyUseCase: TransferMoneyUseCase = .instantiate(transferService: transferStub)
        let dummyEnvironment: TransfersEnvironment = .init(transferAmountUseCase: dummyUseCase)
        let sut = TransfersViewModel(initialState: .init(), environment: dummyEnvironment)

        sut.updateAmountToTransfer("123")
        sut.selectContact(Contact.fixture())

        var cancellables: Set<AnyCancellable> = []
        var collectedStates: [TransfersState] = []

        let objectWillChangeCompletionExpectation = expectation(description: "objectWillChangeCompletionExpectation")
        objectWillChangeCompletionExpectation.expectedFulfillmentCount = 3

        sut.$state
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { newState in
                    collectedStates.append(newState)
                    objectWillChangeCompletionExpectation.fulfill()
                }
            ).store(in: &cancellables)

        // When
        sut.executeTransfer()

        // Then
        wait(for: [objectWillChangeCompletionExpectation], timeout: 1.0)

        let expectedStates: [TransfersState] = [
            .init(amountToTransfer: "123", selectedContact: Contact.fixture(), canExecuteTransfer: true, transferRequestSuceeded: false),
            .init(amountToTransfer: "123", selectedContact: Contact.fixture(), canExecuteTransfer: true, transferRequestSuceeded: false),
            .init(amountToTransfer: "123", selectedContact: Contact.fixture(), canExecuteTransfer: true, transferRequestSuceeded: true),
        ]

        XCTAssertEqual(expectedStates, collectedStates)
    }
}
