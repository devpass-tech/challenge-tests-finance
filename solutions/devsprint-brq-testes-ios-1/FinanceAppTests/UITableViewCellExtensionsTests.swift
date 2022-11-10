import XCTest
@testable import FinanceApp

class UITableViewCellExtensionsTests: XCTestCase {
    
//    private let sut = ActivityCellView()

    func test_classIdentifier_shoudReturnClassName() {
        XCTAssertEqual(ActivityCellView.classIdentifier(), "ActivityCellView")
    }
}
