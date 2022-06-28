protocol RemoteConfigProviderProtocol {
    func shouldExecute(_ feature: RemoteConfigProvider.Feature) -> Bool
}

final class RemoteConfigProvider: RemoteConfigProviderProtocol {
    func shouldExecute(_ feature: Feature) -> Bool {
        switch feature {
        case .getDefaultProfile:
            return true
        case .getProfileType(let type):
            return type == .premium ? true : false
        case .getActivities:
            return true
        }
    }
}

extension RemoteConfigProvider {
    enum Feature {
        case getDefaultProfile
        case getProfileType(_ type: ProfileType)
        case getActivities
        
        enum ProfileType {
            case premium, standard
        }
    }
}
