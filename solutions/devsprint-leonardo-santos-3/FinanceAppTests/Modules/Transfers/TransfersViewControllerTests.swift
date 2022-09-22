
import XCTest

@testable import FinanceApp

final class TransfersViewControllerTests: XCTestCase {

    // MARK: - Private Properties
    
    private let sut = TransfersViewControllerSpy()
    
    // MARK: - Methods
    
    func test_didPressChooseContactButton_contactListViewControllerToPresent() {
        
        // When
        sut.didPressChooseContactButton()
        
        // Then
        XCTAssertTrue(sut.viewControllerToPresent is ContactListViewController)
    }
    
    func test_didPressChooseContactButton_confirmationViewControllerToPresent() {
        
        // When
        sut.didPressTransferButton()
        
        // Then
        XCTAssertTrue(sut.viewControllerToPresent is ConfirmationViewController)
    }
}
