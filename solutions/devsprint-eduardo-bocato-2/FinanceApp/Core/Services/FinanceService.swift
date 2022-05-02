import Foundation

final class FinanceService {
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

    func fetchContactList(_ completion: @escaping ([Contact]?) -> Void) {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/contact_list_endpoint.json")!

        NetworkClient.shared.performRequest(with: url) { data in
            guard let data = data else {
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let contactList = try decoder.decode([Contact].self, from: data)
                completion(contactList)
            } catch {
                completion(nil)
            }
        }
    }

    func transferAmount(_ completion: @escaping (TransferResult?) -> Void) {
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
