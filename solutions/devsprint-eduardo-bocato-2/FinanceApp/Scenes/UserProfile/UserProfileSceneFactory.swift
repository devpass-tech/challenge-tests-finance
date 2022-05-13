import UIKit

protocol UserProfileSceneFactoryProtocol {
    func makeViewController() -> UIViewController
}

struct UserProfileSceneFactory: UserProfileSceneFactoryProtocol {
    func makeViewController() -> UIViewController {
        UserProfileViewController(
            environment: .init(
                userService: FinanceService(),
                userProfileViewDataMapper: .live,
                mainQueue: AsyncQueue.main
            )
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

struct UserProfileSceneFactoryDummy: UserProfileSceneFactoryProtocol {
    func makeViewController() -> UIViewController { .init() }
}
#endif
