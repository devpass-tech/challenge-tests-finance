@testable import FinanceApp
import XCTest

final class UserProfileViewControllerTests: XCTestCase {
    func test_viewWillAppear_setsLoadedDataOnUserProfileView() {
        // Given
        var environment: UserProfileViewController.Environment = .failing
        
        let userServiceStub: UserProfileServiceStub = .init()
        userServiceStub.userProfileToBeReturned = .fixture()
        
        environment.userService = userServiceStub
        environment.userProfileViewDataMapper = .live
        environment.mainQueue = SyncQueue.global
        
        let sut: UserProfileViewController = .init(environment: environment)
        
        let userProfileViewSpy: UserProfileViewSpy = .init(frame: .zero)
        sut.customView = userProfileViewSpy
        
        // When
        sut.viewWillAppear(true)
        
        // Then
        XCTAssertNotNil(userProfileViewSpy.dataPassed)
    }
}

// MARK: - Helpers

final class UserProfileViewSpy: UIView, UserProfileViewProtocol {
    private(set) var dataPassed: UserProfileViewData?
    func setData(_ data: UserProfileViewData) {
        dataPassed = data
    }
}
