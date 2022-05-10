import UIKit

protocol UserProfileSceneFactoryProtocol {
    func makeViewController() -> UIViewController
}

struct UserProfileSceneFactory: UserProfileSceneFactoryProtocol {
    func makeViewController() -> UIViewController {
        UserProfileViewController(
            userService: FinanceService(),
            userProfileViewDataMapper: .live
        )
    }
}

#if DEBUG
final class UserProfileSceneFactorySpy: UserProfileSceneFactoryProtocol {
    private(set) var makeViewControllerCalled = false
    func makeViewController() -> UIViewController {
        makeViewControllerCalled = true
        return .init()
    }
}
#endif
