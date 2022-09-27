import XCTest
@testable import FinanceApp

final class RemoteConfigProviderTests: XCTestCase {
    
    private let sut = RemoteConfigProvider()
    private let feature = RemoteConfigProvider.Feature.self
    
    func test_shouldExecute_givenFeatureGetDefaultProfileFeature(){
        let expectedResult = sut.shouldExecute(feature.getDefaultProfile)
        
        XCTAssertTrue(expectedResult)
    }
    
    func test_shouldExecute_givenFeatureGetProfileTypePremium(){
        let expectedResult = sut.shouldExecute(feature.getProfileType(feature.ProfileType.premium))
        
        XCTAssertTrue(expectedResult)
    }
    
    func test_shouldExecute_givenFeatureGetProfileTypeStandard(){
        let expectedResult = sut.shouldExecute(feature.getProfileType(feature.ProfileType.standard))
        
        XCTAssertFalse(expectedResult)
    }
    
    func test_shouldExecute_givenFeatureGetActivities(){
        let expectedResult = sut.shouldExecute(feature.getActivities)
        
        XCTAssertTrue(expectedResult)
    }
    
}
