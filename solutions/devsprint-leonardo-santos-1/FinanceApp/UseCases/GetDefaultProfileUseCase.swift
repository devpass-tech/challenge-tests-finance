final class GetDefaultProfileUseCase {
    func execute(_ completion: @escaping (UserProfile?) -> Void) {
        let remoteConfigProvider = RemoteConfigProvider()
        
        if remoteConfigProvider.shouldExecute(.getDefaultProfile) {
            completion(.defaultProfile)
        } else {
            completion(nil)
        }
    }
}

private extension UserProfile {
    static var defaultProfile: Self {
        .init(
            name: "Anonimo",
            phone: "Insira seu telefone",
            email: "Insira seu email",
            address: "Insira seu endereço",
            account: .init(agency: "1234", account: "4567")
        )
    }
}
