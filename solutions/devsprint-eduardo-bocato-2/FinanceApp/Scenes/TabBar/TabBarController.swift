import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeTab = makeHomeTab()
        let transferTab = makeTransfersTab()

        viewControllers = [
            homeTab,
            transferTab
        ]
    }
    
    private func makeHomeTab() -> UINavigationController {
        var homeViewModel = HomeViewModel(
            homeService: FinanceService.self
        )
        let homeViewController = HomeViewController(
            viewModel: homeViewModel,
            userProfileSceneFactory: UserProfileSceneFactory()
        )
        homeViewModel.delegate = homeViewController
        
        let homeNavigationController = UINavigationController(
            rootViewController: homeViewController
        )
        
        let homeTabBar = UITabBarItem(
            title: "Home",
            image: .init(named: "house.fill"),
            tag: 0
        )
        homeNavigationController.tabBarItem = homeTabBar
        
        return homeNavigationController
    }
    
    private func makeTransfersTab() -> UINavigationController {
        let transfersViewModel: TransfersViewModel = .init(
            initialState: .init(),
            environment: .live
        )
        let transfersViewController = TransfersViewController(
            viewModel: transfersViewModel
        )
        
        let transfersNavigationController = UINavigationController(
            rootViewController: transfersViewController
        )
        
        let transfersTabBar = UITabBarItem(
            title: "Transfers",
            image: .init(named: "arrow.up.arrow.down"),
            tag: 1
        )
        transfersNavigationController.tabBarItem = transfersTabBar
        
        return transfersNavigationController
    }
}
