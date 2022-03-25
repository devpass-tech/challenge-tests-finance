import XCTest
import SnapshotTesting
@testable import FinanceApp

class UserProfileHeaderViewSnapshotTests: XCTestCase {

    let size = CGSize(width: 414, height: 300)
    let isRecord = false
    
    func test_UserProfileHeaderView() {
        let sut = UserProfileHeaderView()
        
        assertSnapshot(matching: sut, as: .image(size: size), record: isRecord)
    }
}
