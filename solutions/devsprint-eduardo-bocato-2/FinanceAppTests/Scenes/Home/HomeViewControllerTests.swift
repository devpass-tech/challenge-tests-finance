@testable import FinanceApp
import XCTest
import UIKit

final class HomeViewControllerTests: XCTestCase {
    func test_openProfile_shouldOpenUserProfileViewController() throws {
        // Given
        
        let homeViewControllerSpy = HomeViewControllerSpy.self
        homeViewControllerSpy.reset()
        
        let userProfileSceneFactorySpy: UserProfileSceneFactorySpy = .init()
        
        let sut = HomeViewController(
            viewModel: .init(homeService: HomeServiceDummy.self),
            userProfileSceneFactory: userProfileSceneFactorySpy
        )
        _ = sut.view // calls loadView
        let openProfileSelector = try XCTUnwrap(sut.navigationItem.rightBarButtonItem?.action)
        
        // When
        sut.perform(openProfileSelector)
        
        // Then
        XCTAssertEqual(HomeViewControllerSpy.animatedFlagPassed, true)
        XCTAssertNil(HomeViewControllerSpy.completionPassed)
        
        let navigationController = HomeViewControllerSpy.viewControllerToPresentPassed as? UINavigationController
        XCTAssertEqual(navigationController?.viewControllers.count, 1)
        
        XCTAssertTrue(userProfileSceneFactorySpy.makeViewControllerCalled)
    }
}

// MARK: - Helpers

fileprivate enum HomeViewControllerSpy {
    static var presentCalled: Bool = false
    static var viewControllerToPresentPassed: UIViewController?
    static var animatedFlagPassed: Bool?
    static var completionPassed: (() -> Void)?
    
    static func reset() {
        presentCalled = false
        viewControllerToPresentPassed = nil
        animatedFlagPassed = nil
        completionPassed = nil
    }
}

extension HomeViewController {
    public override func present(
        _ viewControllerToPresent: UIViewController,
        animated flag: Bool,
        completion: (() -> Void)? = nil
    ) {
        HomeViewControllerSpy.presentCalled = true
        HomeViewControllerSpy.viewControllerToPresentPassed = viewControllerToPresent
        HomeViewControllerSpy.animatedFlagPassed = flag
        HomeViewControllerSpy.completionPassed = completion
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}
