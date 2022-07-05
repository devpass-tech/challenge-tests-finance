/// Essa classe é apenas um `facade` (fachada) de implementação do SDK. Caso o app vá utilizar  o SDK, deve depender dessa classe e não diretamente do SDK.
final class AnySDKFirstImpl {
    
    // MARK: - Private Properties
    
    private let isEnabled: Bool
    private let sdk: AnySdkProtocol
    init(isEnabled: Bool,
         sdk: AnySdkProtocol = AnySdk()) {
        self.isEnabled = isEnabled
        self.sdk = sdk
    }
    
    // MARK: - Public Methods
    
    func initSDK() {
        if isEnabled {
            type(of: sdk).initSdk()
        }
    }
    
    func trackEvent(_ eventName: String) {
        if isEnabled {
            type(of: sdk).trackEvent(eventName)
        }
    }
}
