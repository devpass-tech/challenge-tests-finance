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
#endif
