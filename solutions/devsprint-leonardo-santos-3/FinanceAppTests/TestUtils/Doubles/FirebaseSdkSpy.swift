@testable import FinanceApp

final class FirebaseSdkSpy: FirebaseSdkProtocol {
    
    private(set) static var initSdkCalled: Bool = false
    private(set) static var initSdkCallCount: Int = 0
    private(set) static var trackEventCalled: Bool = false
    private(set) static var trackEventCallCount: Int = 0
    
    static func initSdk() {
        initSdkCalled = true
        initSdkCallCount += 1
    }
    
    static func trackEvent(_ eventName: String) {
        trackEventCalled = true
        trackEventCallCount += 1
    }
    
    static func clear(){
        initSdkCalled = false
        initSdkCallCount = 0
        trackEventCalled = false
        trackEventCallCount = 0
    }
    
}
