import XCTest
@testable import FinanceApp

class UITableViewCellExtensionsTests: XCTestCase {

    func test_classIdentifier_shoudReturnClassName() {
        XCTAssertEqual(ActivityCellView.classIdentifier(), "ActivityCellView")
    }
}
