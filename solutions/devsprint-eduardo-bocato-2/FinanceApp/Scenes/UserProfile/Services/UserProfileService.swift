import Foundation
import UIKit

protocol UserProfileServiceProtocol {
    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void)
}
extension FinanceService: UserProfileServiceProtocol {}

#if DEBUG
final class UserProfileServiceStub: UserProfileServiceProtocol {
    var userProfileToBeReturned: UserProfile?
    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void) {
        completion(userProfileToBeReturned)
    }
}

import XCTestDynamicOverlay

final class UserProfileServiceFailing: UserProfileServiceProtocol {
    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void) {
        XCTFail("UserProfileService.fetchUserProfile was not implemented.")
    }
}
#endif
