@testable import FinanceApp
import SnapshotTesting
import XCTest

final class HomeViewTests: XCTestCase {
    func test_homeView_whenTheListIsEmpty() {
        // Given
        let sut = HomeView()
        
        // When
        sut.setData(.fixture())
        
        // Then
        assertSnapshot(
            matching: sut,
            as: .image
        )
    }
}
