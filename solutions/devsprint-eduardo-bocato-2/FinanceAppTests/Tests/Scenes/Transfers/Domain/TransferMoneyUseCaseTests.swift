import Combine
import XCTest
@testable import FinanceApp

final class TransferMoneyUseCaseTests: XCTestCase {
    // MARK: - Properties
    
    private var subscriptions: Set<AnyCancellable> = .init()
    
    // MARK: - Tests
    
    func test_execute_() {
        // Given
        let input = "haha"
        let sut: TransferMoneyUseCase = .instantiate(
            transferService: TransfersServiceDummy()
        )
        
        // When
        var errorReceived: TransferMoneyUseCase.Error?
        let errorExpectation = expectation(description: "Expecting to receive an `invalidInput` error.")
        sut.execute(input)
            .sink(
                receiveCompletion: { completion in
                    if case let .failure(error) = completion {
                        errorReceived = error
                        errorExpectation.fulfill()
                    }
                },
                receiveValue: { value in
                    XCTFail("We should not get a value here, since error kills the flow.")
                }
            )
            .store(in: &subscriptions)
        wait(for: [errorExpectation], timeout: 0.5)
        
        // Then
        XCTAssertEqual(errorReceived, .invalidInput)
    }
    
    func util(file: StaticString = #file, line: UInt = #line) {
        XCTFail("blah", file: file, line: line)
    }
}
