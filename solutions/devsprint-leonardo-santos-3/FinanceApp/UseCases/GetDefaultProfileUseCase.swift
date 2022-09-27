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
            name: "Devpass",
            phone: "(11) 91234-5678",
            email: "teste@devpass.com.br",
            address: "Av teste, 1234",
            account: .init(agency: "1234", account: "5678")
        )
    }
}
