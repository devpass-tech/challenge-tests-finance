import XCTest
@testable import FinanceApp

class AnySDKThirdImplTests: XCTestCase {
    
    private var isEnabled = false
    private var eventToBeTracked: String = ""
    private var spy = AnySDKThirdImplSpy.self
    private lazy var sut = AnySDKThirdImpl(
        isEnabled: isEnabled,
        anySDK: spy
    )

    func test_AnySDKThirdImpl_whenIsNotEnabled_shouldNotCallInitSDK () {
        isEnabled = false
        sut.initSDK()
        XCTAssertEqual(spy.initSdkCounter, 0)
    }
    
    func test_AnySDKThirdImpl_whenIsEnabled_shouldCallInitSDK () {
        isEnabled = true
        sut.initSDK()
        XCTAssertEqual(spy.initSdkCounter, 1)
    }

    func test_AnySDKThirdImpl_whenIsEnabled_shouldTrackEventAndMatchNames() {
        isEnabled = true
        eventToBeTracked = "trackEventTest"
        sut.trackEvent(eventToBeTracked)
        
        XCTAssertEqual(spy.trackEventCounter, 1)
        XCTAssertEqual(spy.eventName, eventToBeTracked)
    }
    
    func test_AnySDKThirdImpl_whenIsNotEnabled_shouldNotTrackEvent() {
        isEnabled = false
        sut.trackEvent(eventToBeTracked)
        XCTAssertEqual(spy.trackEventCounter, 0)
    }
    
    override func tearDown() async throws {
        spy.tearDown()
    }

}
