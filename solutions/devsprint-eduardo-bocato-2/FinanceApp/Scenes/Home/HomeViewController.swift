import UIKit

final class HomeViewController: UIViewController {
    // MARK: - Dependencies
    
    private var viewModel: HomeViewModel
    private let userProfileSceneFactory: UserProfileSceneFactoryProtocol
    
    // MARK: - UI
    
    private lazy var homeView: HomeView = {
        let homeView = HomeView()
        homeView.delegate = self
        return homeView
    }()
    
    // MARK: - Initialization
    
    init(
        viewModel: HomeViewModel,
        userProfileSceneFactory: UserProfileSceneFactoryProtocol
    ) {
        self.viewModel = viewModel
        self.userProfileSceneFactory = userProfileSceneFactory
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData()
    }

    override func loadView() {
        view = homeView
        setupNavigationBar()
    }
    
    // MARK: - Setup
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Profile",
            style: .plain,
            target: self,
            action: #selector(openProfile)
        )
    }

    // MARK: - Actions
    
    @objc private func openProfile() {
        let navigationController = UINavigationController(
            rootViewController: userProfileSceneFactory.makeViewController()
        )
        present(navigationController, animated: true)
    }
}

// MARK: - HomeViewModelDelegate
extension HomeViewController: HomeViewModelDelegate {
    func didFetchHomeData(_ data: HomeData) {
        DispatchQueue.main.async {
            self.homeView.setData(data)
        }
    }
}

// MARK: - HomeViewDelegate
extension HomeViewController: HomeViewDelegate {
    func didSelectActivity() {
        let activityDetailsViewController = ActivityDetailsViewController(
            viewModel: .init()
        )
        navigationController?.pushViewController(activityDetailsViewController, animated: true)
    }
}
