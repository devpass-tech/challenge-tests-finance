import XCTest

@testable import FinanceApp

final class ActivityTests:XCTestCase {
    let sut = Activity(name: "Atividade de teste", price: 2, time: "1")
    
    
    func test_formattedInfo_shouldReturnFormattedActivityInfo(){
        let formattedInfo = sut.formattedInfo()
        
        
        XCTAssertNotNil(formattedInfo)
        XCTAssertEqual(formattedInfo, "$\(sut.price) • \(sut.time)")
    }
    
}
