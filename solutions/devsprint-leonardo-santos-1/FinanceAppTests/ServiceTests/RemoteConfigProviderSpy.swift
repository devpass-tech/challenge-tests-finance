@testable import FinanceApp

final class RemoteConfigProviderSpy: RemoteConfigProviderProtocol {
    
    private(set) var shouldExecuteCalled: Bool = false
    private(set) var shouldExecuteFeaturePassed: RemoteConfigProvider.Feature?
    var shouldExecuteToBeReturned: Bool = false
    
    func shouldExecute(_ feature: RemoteConfigProvider.Feature) -> Bool {
        shouldExecuteCalled = true
        shouldExecuteFeaturePassed = feature
        return shouldExecuteToBeReturned
    }
}
