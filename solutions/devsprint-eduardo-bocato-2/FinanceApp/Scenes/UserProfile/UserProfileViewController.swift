import UIKit

final class UserProfileViewController: UIViewController {
    override func loadView() {
        view = UserProfileView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadViewData()
    }
    
    private func loadViewData() {
        FinanceService().fetchUserProfile { [weak self] profile in
            guard let profile = profile else { return }
            let viewData = UserProfileViewDataMapper.live.map(profile)
            DispatchQueue.main.async {
                (self?.view as? UserProfileView)?.setData(viewData)
            }
        }
    }
}
