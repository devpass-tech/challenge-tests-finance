import UIKit

final class UserProfileViewController: UIViewController {
    // MARK: - Dependencies
    
    private let userService: UserProfileServiceProtocol
    private let userProfileViewDataMapper: UserProfileViewDataMapper
    
    // MARK: - Properties
    
    private var customView: UserProfileView? { view as? UserProfileView }
    
    // MARK: - Initialization
    
    init(
        userService: UserProfileServiceProtocol,
        userProfileViewDataMapper: UserProfileViewDataMapper
    ) {
        self.userService = userService
        self.userProfileViewDataMapper = userProfileViewDataMapper
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = UserProfileView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadViewData()
    }
    
    private func loadViewData() {
        userService.fetchUserProfile { [userProfileViewDataMapper, customView] profile in
            guard let profile = profile else { return }
            let viewData = userProfileViewDataMapper.map(profile)
            DispatchQueue.main.async {
                customView?.setData(viewData)
            }
        }
    }
}
