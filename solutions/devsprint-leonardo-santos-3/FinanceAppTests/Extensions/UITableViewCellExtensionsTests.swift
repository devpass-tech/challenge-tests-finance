
import XCTest

@testable import FinanceApp

class UITableViewExtensionTests: XCTestCase {

    func test_classIdentifier_EqualToTableViewCellName() {
        let givenIdentifier = UITableViewCell.classIdentifier()
        XCTAssertEqual(givenIdentifier, "UITableViewCell")
    }

    func test_classIdentifier_EqualToDifferentCustomCell() {
        let givenIdentifier = DifferentCustomCell.classIdentifier()
        XCTAssertEqual(givenIdentifier, "DifferentCustomCell")
    }

    func test_classIdentifier_NotEqualToUITableViewCell() {
        let givenIdentifier = DifferentCustomCell.classIdentifier()
        XCTAssertNotEqual(givenIdentifier, "UITableViewCell")
    }
}

final private class DifferentCustomCell: UITableViewCell {}
