@testable import FinanceApp
import XCTest

final class TabBarControllerTests: XCTestCase {
    func test_viewDidLoad_shouldConfigureTabsCorrectly() throws {
        // Given
        let sut = TabBarController()
        
        // When
        sut.viewDidLoad()
        
        // Then
        XCTAssertEqual(sut.viewControllers?.count, 2)
        
        let firstViewController = sut.viewControllers?.first
        
        let homeNavigation = try XCTUnwrap(firstViewController as? UINavigationController)
        
        XCTAssertNotNil(homeNavigation.tabBarItem)
        XCTAssertEqual(homeNavigation.tabBarItem.title, "Home")
        XCTAssertEqual(homeNavigation.tabBarItem.tag, 0)
        
        let homeViewController = try XCTUnwrap(homeNavigation.viewControllers.first as? HomeViewController)
        
        let homeVCMirror = Mirror(reflecting: homeViewController)
        
        let homeViewModel = try XCTUnwrap(homeVCMirror.children.first(
                where: { $0.label == "viewModel" }
            )?.value as? HomeViewModel
        )
        XCTAssertTrue(homeViewModel.delegate === homeViewController)
 
        let userProfileSceneFactory = homeVCMirror.children.first(
            where: { $0.label == "userProfileSceneFactory" }
        )?.value
        XCTAssertTrue(userProfileSceneFactory is UserProfileSceneFactory)
        
        let homeViewModelMirror = Mirror(reflecting: homeViewModel)
        let homeService = homeViewModelMirror.children.first(
            where: { $0.label == "homeService" }
        )?.value
        let homeServiceDescription = String(describing: homeService)
        XCTAssertTrue(homeServiceDescription.contains("FinanceService"))
        
        
    }
}
