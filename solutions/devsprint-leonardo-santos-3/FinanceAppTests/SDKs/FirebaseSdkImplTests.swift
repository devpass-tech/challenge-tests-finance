import XCTest
@testable import FinanceApp

final class FirebaseSdkImplTests:XCTestCase {
    
    private let firebaseSdkSpy = FirebaseSdkSpy.self
    private var isEnabled = false
    private lazy var sut = FirebaseSdkImpl(
        isEnabled: isEnabled,
        firebaseSdk: firebaseSdkSpy)
    
    override func tearDown() {
        super.tearDown()
        firebaseSdkSpy.clear()
    }
    
    func test_initSDK_givenIsEnabledFirebaseSdkImpl_shouldCallInitSdk(){
        isEnabled = true
        sut.initSDK()
        
        XCTAssertTrue(firebaseSdkSpy.initSdkCalled)
    }
    
    func test_initSDK_givenIsNotEnabledFirebaseSdkImpl_shouldNotCallInitSdk(){
        isEnabled = false
        sut.initSDK()
        
        XCTAssertFalse(firebaseSdkSpy.initSdkCalled)
    }
    
    func test_initSDK_givenIsEnabledFirebaseSdkImpl_shouldCallInitSdkOnce(){
        isEnabled = true
        sut.initSDK()
        
        XCTAssertEqual(firebaseSdkSpy.initSdkCallCount, 1)
    }
    
    func test_trackEvent_givenIsEnabledFirebaseSdkImpl_shouldCallTrackEvent(){
        isEnabled = true
        sut.trackEvent("")
        
        XCTAssertTrue(firebaseSdkSpy.trackEventCalled)
    }
    
    func test_trackEvent_givenIsNotEnabledFirebaseSdkImpl_shouldNotCallTrackEvent(){
        isEnabled = false
        sut.trackEvent("")
        
        XCTAssertFalse(firebaseSdkSpy.trackEventCalled)
    }
    
    func test_trackEvent_givenIsEnabledFirebaseSdkImpl_shouldCallTrackEventOnce(){
        isEnabled = true
        sut.trackEvent("")
        
        XCTAssertEqual(firebaseSdkSpy.trackEventCallCount, 1)
    }
    
    func test_trackEvent_givenIsEnabledFirebaseSdkImpl_shouldReceiveValidEventName(){
        isEnabled = true
        let expectedResult = "event_test"
        sut.trackEvent("event_test")
        
        XCTAssertEqual(firebaseSdkSpy.eventNameReceived, expectedResult)
    }
    
    
}
