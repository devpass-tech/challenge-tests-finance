import Foundation

final class LoginInteractor {
    
    // MARK: - VIPER Properties

    weak var output: LoginInteractorOutputProtocol?

    // MARK: - Private Properties
    
    private let network: NetworkClientProtocol

    // MARK: - Inits
    
    init(network: NetworkClientProtocol) {
        self.network = network
    }

    // MARK: - Internal Methods
    
    // MARK: - Private Methods 
}

// MARK: - Input Protocol
extension LoginInteractor: LoginInteractorInputProtocol {
    func authenticate(email: String, password: String) {
        // TODO: Implement network layer here
        
        if email.lowercased() == "teste@teste.com" && password == "1111" {
            output?.authenticationSuccessful()
        } else {
            output?.authenticationFailed()
        }
    }
}
