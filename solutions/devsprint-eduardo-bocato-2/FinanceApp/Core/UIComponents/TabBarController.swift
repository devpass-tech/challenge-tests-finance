import UIKit

final class TabBarController: UITabBarController {
    override func viewWillAppear(_: Bool) {
        let homeViewController = HomeViewController()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        let homeTabBar = UITabBarItem(title: "Home", image: UIImage(named: "house.fill"), tag: 0)
        homeNavigationController.tabBarItem = homeTabBar

        let transfersViewController = TransfersViewController()
        let transfersNavigationController = UINavigationController(rootViewController: transfersViewController)
        let transfersTabBar = UITabBarItem(title: "Transfers", image: UIImage(named: "arrow.up.arrow.down"), tag: 1)
        transfersNavigationController.tabBarItem = transfersTabBar

        viewControllers = [homeNavigationController, transfersNavigationController]
    }
}
