import Foundation
import Combine

protocol HomeServiceProtocol {
    static func fetchHomeData(_ completion: @escaping (HomeData?) -> Void)
}

final class FinanceService: HomeServiceProtocol {
    static func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json")!

        NetworkClient.shared.performRequest(with: url) { data in
            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let homeData = try decoder.decode(HomeData.self, from: data)
                completion(homeData)
            } catch {
                completion(nil)
            }
        }
    }
    
    static func fetchContactList(_ completion: @escaping (Result<[Contact], NetworkingError>) -> Void) {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/contact_list_endpoint.json")!

        NetworkClient.shared.performRequest(with: url) { data in
            guard let data = data else {
                completion(.failure(.unexpected))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let contactList = try decoder.decode([Contact].self, from: data)
                completion(.success(contactList))
            } catch {
                completion(.success([]))
            }
        }
    }
    
    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void) {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/activity_details_endpoint.json")!

        NetworkClient.shared.performRequest(with: url) { data in
            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let activityDetails = try decoder.decode(ActivityDetails.self, from: data)
                completion(activityDetails)
            } catch {
                completion(nil)
            }
        }
    }

    func transferAmount(_ amount: Float, _ completion: @escaping (TransferResult?) -> Void) {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/transfer_successful_endpoint.json")!

        NetworkClient.shared.performRequest(with: url) { data in
            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let transferResult = try decoder.decode(TransferResult.self, from: data)
                completion(transferResult)
            } catch {
                completion(nil)
            }
        }
    }

    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void) {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/user_profile_endpoint.json")!
        NetworkClient.shared.performRequest(with: url) { data in
            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let userProfile = try decoder.decode(UserProfile.self, from: data)
                completion(userProfile)
            } catch {
                completion(nil)
            }
        }
    }
}
