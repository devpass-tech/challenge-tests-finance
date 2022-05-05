@testable import FinanceApp
import XCTest
import UIKit

final class HomeViewControllerTests: XCTestCase {
    
    func test_openProfile_shouldOpenUserProfileViewController() {
        // Given
        HomeViewControllerSpy.reset()
        
        let sut = HomeViewController(
            viewModel: .init()
        )
        sut.viewDidLoad()
        
        // When
        let selector = Selector("openProfile")
        sut.perform(selector)
        
        // Then
        XCTAssertEqual(HomeViewControllerSpy.animatedFlagPassed, true)
        XCTAssertNil(HomeViewControllerSpy.completionPassed)
        guard
            let navigationController = HomeViewControllerSpy.viewControllerToPresentPassed as? UINavigationController,
            let firstViewController = navigationController.viewControllers.first
        else {
            XCTFail("Expected an UINavigationController, with valid first ViewController!")
            return
        }
        
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertTrue(firstViewController is UserProfileViewController)
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
