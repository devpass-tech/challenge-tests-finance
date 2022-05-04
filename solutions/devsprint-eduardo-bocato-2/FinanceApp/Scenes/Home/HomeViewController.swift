import UIKit

final class HomeViewController: UIViewController, HomeViewModelDelegate {
    private var viewModel: HomeViewModel
    
    private lazy var homeView: HomeView = {
        let homeView = HomeView()
        homeView.delegate = self
        return homeView
    }()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(openProfile))
        viewModel.fetchData()
    }

    override func loadView() {
        view = homeView
    }

    @objc private func openProfile() {
        let navigationController = UINavigationController(rootViewController: UserProfileViewController())
        present(navigationController, animated: true)
    }
    
    func didFetchHomeData(_ data: HomeData) {
        DispatchQueue.main.async {
            self.homeView.setData(data)
        }
    }
}

extension HomeViewController: HomeViewDelegate {
    func didSelectActivity() {
        let activityDetailsViewController = ActivityDetailsViewController(
            viewModel: .init()
        )
        navigationController?.pushViewController(activityDetailsViewController, animated: true)
    }
}
