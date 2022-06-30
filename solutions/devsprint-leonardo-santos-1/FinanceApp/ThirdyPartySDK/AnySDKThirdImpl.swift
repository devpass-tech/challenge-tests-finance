/// Essa classe é apenas um `facade` (fachada) de implementação do SDK. Caso o app vá utilizar  o SDK, deve depender dessa classe e não diretamente do SDK.

protocol AnySdkProtocol {
    static func initSdk()
    static func trackEvent(_ eventName: String)
}


final class AnySDKThirdImpl {
        
    private let isEnabled: Bool
    private let sdk: AnySdkProtocol.Type
    
    init(isEnabled: Bool, anySDK: AnySdkProtocol.Type) {
        self.isEnabled = isEnabled
        self.sdk = anySDK
    }
    
    func initSDK() {
        if isEnabled {
            sdk.initSdk()
        }
    }
    
    func trackEvent(_ eventName: String) {
        if isEnabled {
            sdk.trackEvent(eventName)
        }
    }
}

