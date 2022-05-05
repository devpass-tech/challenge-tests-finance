import XCTest
@testable import FinanceApp

final class StringExtensionTests: XCTestCase {
    func test_whenStringHasMidSpace_shouldRemoveSpace() throws {
        //Given
        let sut: String = "some text"
        //When
        let result = sut.removingSpaces()
        //Then
        XCTAssertEqual(result, "sometext")
    }

    func test_whenStringHasTailSpace_shouldRemoveSpace() throws {
        //Given
        let sut: String = "sometext "
        //When
        let result = sut.removingSpaces()
        //Then
        XCTAssertEqual(result, "sometext")
    }

    func test_whenStringHasTrailSpace_shouldRemoveSpace() throws {
        //Given
        let sut: String = " sometext"
        //When
        let result = sut.removingSpaces()
        //Then
        XCTAssertEqual(result, "sometext")
    }
}
