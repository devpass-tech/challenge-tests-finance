/// Essa classe é apenas um `facade` (fachada) de implementação do SDK. Caso o app vá utilizar  o SDK, deve depender dessa classe e não diretamente do SDK. Dessa forma, evitamos que o projeto dependa desse framework e facilita a sua manutenção e alteração o futuro
final class FirebaseSdkImpl {
    
    // MARK: - Private Properties
    
    private let isEnabled: Bool
    private let firebaseSdk: FirebaseSdkProtocol.Type
    
    init(isEnabled: Bool, firebaseSdk: FirebaseSdkProtocol.Type = FirebaseSdk.self) {
        self.isEnabled = isEnabled
        self.firebaseSdk = firebaseSdk
    }
    
    // MARK: - Public Methods
    
    func initSDK() {
        if isEnabled {
            firebaseSdk.initSdk()
        }
    }
    
    func trackEvent(_ eventName: String) {
        if isEnabled {
            firebaseSdk.trackEvent(eventName)
        }
    }
}

//MARK: - Firebase SDK Protocol

protocol FirebaseSdkProtocol {
    static func initSdk()
    static func trackEvent(_ eventName:String)
}

extension FirebaseSdk: FirebaseSdkProtocol {}
