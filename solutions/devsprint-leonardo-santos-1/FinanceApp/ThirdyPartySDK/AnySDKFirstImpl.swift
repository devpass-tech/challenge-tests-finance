/// Essa classe é apenas um `facade` (fachada) de implementação do SDK. Caso o app vá utilizar  o SDK, deve depender dessa classe e não diretamente do SDK.
final class AnySDKFirstImpl {
    
    // MARK: - Private Properties
    
    private let isEnabled: Bool
    
    init(isEnabled: Bool) {
        self.isEnabled = isEnabled
    }
    
    // MARK: - Public Methods
    
    func initSDK() {
        if isEnabled {
            AnySdk.initSdk()
        }
    }
    
    func trackEvent(_ eventName: String) {
        if isEnabled {
            AnySdk.trackEvent(eventName)
        }
    }
}
