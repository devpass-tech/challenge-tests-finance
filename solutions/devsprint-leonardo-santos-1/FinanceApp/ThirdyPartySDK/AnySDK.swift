/// Essa classe serve como **exemplo** para testes unitários em SDKs e em classes que o implementam. Não utilizar esse SDK no projeto.
final class AnySdk {
    
    // MARK: - Private Properties
    private static var sdkInitialized: Bool = false
    private static var userId: String?
    private static var eventTracked: String?

    // MARK: - Public Methods
    
    static func initSdk() {
        sdkInitialized = true
    }
    
    static func setUserId(_ id: String) {
        userId = id
    }
    
    static func trackEvent(_ eventName: String) {
        eventTracked = eventName
    }
}

extension AnySdk: AnySdkProtocol {}
