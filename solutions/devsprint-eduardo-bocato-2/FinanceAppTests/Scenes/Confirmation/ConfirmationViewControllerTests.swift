@testable import FinanceApp
import SnapshotTesting
import XCTest

final class ConfirmationViewControllerSnapshotTests: XCTestCase {
    func test_homeView_whenTheListIsEmpty() {
        // Given
        let isRecordModeOn = false
        let sut = ConfirmationViewController()
        
        // When
        _ = sut.view // forces the view to be loaded
        
        // Then
        assertSnapshot(
            matching: sut,
            as: .image(on: .iPadPro11),
            record: isRecordModeOn
        )
    }
}
