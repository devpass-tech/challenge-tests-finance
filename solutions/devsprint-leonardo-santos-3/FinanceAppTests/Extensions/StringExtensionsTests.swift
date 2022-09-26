import XCTest

@testable import FinanceApp

final class StringExtensionsTests: XCTestCase {

    func test_string_shouldRemoveSpaces() {
        let sut = "  giuliano leonardo "
        let stringWithoutSpaces = sut.removingSpaces()

        XCTAssertEqual(stringWithoutSpaces, "giulianoleonardo")
    }

}
