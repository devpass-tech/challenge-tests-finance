//
//  FinanceService.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol FinanceServiceProtocol: FetchHomeDataProtocol {

    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void)
    func fetchContactList(_ completion: @escaping ([Contact]?) -> Void)
    func transferAmount(_ completion: @escaping (TransferResult?) -> Void)
    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void)
}

protocol FetchHomeDataProtocol {
    
    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void)
}

class FinanceService: FinanceServiceProtocol {

    let networkClient: NetworkClientProtocol

    init(networkClient: NetworkClientProtocol) {

        self.networkClient = networkClient
    }

    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void) {

        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json")!

        networkClient.performRequest(with: url) { data in
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

    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void) {

        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/activity_details_endpoint.json")!

        networkClient.performRequest(with: url) { data in
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

        networkClient.performRequest(with: url) { data in
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

        networkClient.performRequest(with: url) { data in
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

        networkClient.performRequest(with: url) { data in
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
