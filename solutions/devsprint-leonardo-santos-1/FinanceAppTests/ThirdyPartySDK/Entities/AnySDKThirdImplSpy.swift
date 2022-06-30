@testable import FinanceApp

class AnySDKThirdImplSpy: AnySdkProtocol {

    private let isEnabled: Bool
    private(set) static var initSdkCounter = 0
    private(set) static var trackEventCounter = 0
    private(set) static var eventName: String?
    
    init(isEnabled: Bool) {
        self.isEnabled = isEnabled
    }
    
    static func initSdk() {
        self.initSdkCounter += 1
    }
    
    static func trackEvent(_ eventName: String) {
        self.trackEventCounter += 1
        self.eventName = eventName
    }
    
    static func tearDown() {
        self.initSdkCounter = 0
        self.trackEventCounter = 0
    }
    
}
