import UIKit

extension UserProfileViewController {
    struct Environment {
        var userService: UserProfileServiceProtocol
        var userProfileViewDataMapper: UserProfileViewDataMapper
        var mainQueue: Dispatching = AsyncQueue.main
    }
}

final class UserProfileViewController: UIViewController {
    // MARK: - Dependencies
    
    private let environment: Environment
    
    // MARK: - Properties
    
    var customView: UserProfileViewProtocol?
    
    // MARK: - Initialization
    
    init(environment: Environment) {
        self.environment = environment
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        let customView = UserProfileView()
        view = customView
        self.customView = customView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadViewData()
    }
    
    private func loadViewData() {
        environment.userService.fetchUserProfile { [environment, customView] profile in
            guard let profile = profile else { return }
            let viewData = environment.userProfileViewDataMapper.map(profile)
            environment.mainQueue.dispatch {
                customView?.setData(viewData)
            }
        }
    }
}

#if DEBUG
extension UserProfileViewController.Environment {
    static let failing: Self = .init(
        userService: UserProfileServiceFailing(),
        userProfileViewDataMapper: .failing,
        mainQueue: AsyncQueue.failing
    )
}
#endif


