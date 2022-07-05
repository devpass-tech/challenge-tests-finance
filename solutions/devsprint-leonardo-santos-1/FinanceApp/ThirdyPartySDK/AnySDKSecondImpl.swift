/// Essa classe é apenas um `facade` (fachada) de implementação do SDK. Caso o app vá utilizar  o SDK, deve depender dessa classe e não diretamente do SDK.
final class AnySDKSecondImpl {
    
    // MARK: - Private Properties
    
    private let isEnabled: Bool
    private let anySdk: AnySdkProtocol.Type
    
    init(isEnabled: Bool, anySdk: AnySdkProtocol.Type) {
        self.isEnabled = isEnabled
        self.anySdk = anySdk
    }
    
    // MARK: - Public Methods
    
    func initSdk() {
        if isEnabled {
            anySdk.initSdk()
        }
    }
    
    func trackEvent(_ eventName: String) {
        if isEnabled {
            anySdk.trackEvent(eventName)
        }
    }
}

protocol AnySdkProtocol {
    static func initSdk()
    static func trackEvent(_ eventName: String)
}
