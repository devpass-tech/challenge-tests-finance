import XCTest
@testable import FinanceApp

final class StringExtensionTests: XCTestCase {
    func test_removingSpaces_whenStringHasMidSpace_shouldRemoveSpace() throws {
        // Given
        let sut: String = "some text"
        // When
        let result = sut.removingSpaces()
        // Then
        XCTAssertEqual(result, "sometext")
    }

    func test_removingSpaces_whenStringHasTailSpace_shouldRemoveSpace() throws {
        // Given
        let sut: String = "sometext "
        // When
        let result = sut.removingSpaces()
        // Then
        XCTAssertEqual(result, "sometext")
    }

    func test_removingSpaces_whenStringHasTrailSpace_shouldRemoveSpace() throws {
        // Given
        let sut: String = " sometext"
        // When
        let result = sut.removingSpaces()
        // Then
        XCTAssertEqual(result, "sometext")
    }
}
