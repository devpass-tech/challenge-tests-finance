import XCTest
import SnapshotTesting
@testable import FinanceApp

final class ActivityListViewSnapshotTests: XCTestCase {
    typealias Sut = ActivityListView
    
    override func setUp() {
//        SnapshotTesting.isRecording = true
    }
    
    func test_ActivityListView() {
        
        let sut = SampleViewController<Sut>()
        sut.loadViewIfNeeded()
        
        assertSnapshot(matching: sut, as: .image(on: .iPhoneX))
    }
}
