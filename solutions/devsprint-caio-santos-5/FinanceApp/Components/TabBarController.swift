import UIKit

final class TabBarController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        let homeViewController = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        let homeTabBar = UITabBarItem(title: "Home", image: UIImage(named: "house.fill"), tag: 0)
        homeTabBar.accessibilityIdentifier = "homeTabBar"
        homeNavigationController.tabBarItem = homeTabBar

        let transfersViewController = TransfersViewController()
        let transfersNavigationController = UINavigationController(rootViewController: transfersViewController)
        let transfersTabBar = UITabBarItem(title: "Transfers", image: UIImage(named: "arrow.up.arrow.down"), tag: 1)
        transfersTabBar.accessibilityIdentifier = "transfersTabBar"
        transfersNavigationController.tabBarItem = transfersTabBar

        self.viewControllers = [homeNavigationController, transfersNavigationController]
    }
}
