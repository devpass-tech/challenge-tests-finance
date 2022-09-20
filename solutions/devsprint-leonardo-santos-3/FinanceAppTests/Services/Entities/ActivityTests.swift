import XCTest

@testable import FinanceApp

final class ActivityTests: XCTestCase {
    private let sut = Activity(name: "Atividade de teste", price: 2, time: "1")
    
    func test_formattedInfo_shouldReturnFormattedActivityInfo(){
        let expectedFormattedInfo = sut.formattedInfo()
        
        XCTAssertNotNil(expectedFormattedInfo)
        XCTAssertEqual(expectedFormattedInfo, "$\(sut.price) • \(sut.time)")
    }
    
}
