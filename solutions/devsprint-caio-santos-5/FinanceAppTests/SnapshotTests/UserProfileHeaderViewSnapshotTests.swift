import XCTest
import SnapshotTesting
@testable import FinanceApp

class UserProfileHeaderViewSnapshotTests: XCTestCase {
    let viewSize = CGSize(width: 414, height: 232)
    
    override func setUp() {
        SnapshotTesting.isRecording = false
    }
    
    func test_UserProfilerHeaderView() {
        let userProfileHeaderView = UserProfileHeaderView()
        
        assertSnapshot(matching: userProfileHeaderView, as: .image(size: viewSize))
    }
}
