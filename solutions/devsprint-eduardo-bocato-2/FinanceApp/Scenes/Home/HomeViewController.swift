import UIKit

final class HomeViewController: UIViewController {
    private lazy var homeView: HomeView = {
        let homeView = HomeView()
        homeView.delegate = self
        return homeView
    }()

    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(openProfile))
    }

    override func loadView() {
        view = homeView
    }

    @objc private func openProfile() {
        let navigationController = UINavigationController(rootViewController: UserProfileViewController())
        present(navigationController, animated: true)
    }
}

extension HomeViewController: HomeViewDelegate {
    func didSelectActivity() {
        let activityDetailsViewController = ActivityDetailsViewController()
        navigationController?.pushViewController(activityDetailsViewController, animated: true)
    }
}
