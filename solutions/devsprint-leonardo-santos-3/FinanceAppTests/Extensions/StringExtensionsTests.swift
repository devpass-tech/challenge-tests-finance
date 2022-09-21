import XCTest

@testable import FinanceApp

final class StringExtensionsTests: XCTestCase {
    private var sut = String()

    func test_string_shouldRemoveSpaces() {
        sut = "  teste"
        let stringWithoutSpaces = sut.removingSpaces()

        XCTAssertEqual(stringWithoutSpaces, "teste")
    }

}
