@testable import FinanceApp
import SnapshotTesting
import XCTest

final class UserProfileViewDataMapperTests: XCTestCase {
    func test_map_shouldReturnCorrectlyConvertedValues() {
        // Given
        let isRecordModeEnabled = false
        
        let sut: UserProfileViewDataMapper = .live
        let userProfile: UserProfile = .init(
            name: "John",
            phone: "+31 06 1234 1234",
            email: "john@email.com",
            address: "Some address, 10",
            account: .init(
                agency: "1234",
                account: "56789"
            )
        )
        
        // When
        let result = sut.map(userProfile)
        
        // Then
        assertSnapshot(
            matching: result,
            as: .dump,
            record: isRecordModeEnabled
        )
    }
}

















































