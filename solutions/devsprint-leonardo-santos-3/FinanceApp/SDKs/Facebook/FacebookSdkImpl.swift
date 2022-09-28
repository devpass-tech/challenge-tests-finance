/// Essa classe é apenas um `facade` (fachada) de implementação do SDK. Caso o app vá utilizar  o SDK, deve depender dessa classe e não diretamente do SDK. Dessa forma, evitamos que o projeto dependa desse framework e facilita a sua manutenção e alteração o futuro
final class FacebookSdkImpl {
    
    // MARK: - Private Properties
    
    private let isEnabled: Bool
    
    init(isEnabled: Bool) {
        self.isEnabled = isEnabled
    }
    
    // MARK: - Public Methods
    
    func initSDK() {
        if isEnabled {
            FacebookSdk.initSdk()
        }
    }
    
    func trackEvent(_ eventName: String) {
        if isEnabled {
            FacebookSdk.trackEvent(eventName)
        }
    }
}
