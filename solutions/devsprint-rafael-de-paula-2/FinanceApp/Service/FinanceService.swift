//
//  FinanceService.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol FinanceServiceProtocol {
    func fetchHomeData(_ completion: @escaping (Result<HomeData, Error>) -> Void)
    func fetchActivityDetails(_ completion: @escaping (Result<ActivityDetails, Error>) -> Void)
    func fetchContactList(_ completion: @escaping (Result<[Contact], Error>) -> Void)
    func transferAmount(_ completion: @escaping (Result<TransferResult, Error>) -> Void)
    func fetchUserProfile(_ completion: @escaping (Result<UserProfile, Error>) -> Void)
}

class FinanceService: FinanceServiceProtocol {
    let networkClient: NetworkClientProtocol

    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }

    func fetchHomeData(_ completion: @escaping (Result<HomeData, Error>) -> Void) {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/home_endpoint.json")!

        networkClient.performRequest(with: url) { (result: Result<HomeData, NetworkError>) in
            switch result {
            case .success(let content):
                completion(.success(content))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetchActivityDetails(_ completion: @escaping (Result<ActivityDetails, Error>) -> Void) {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/activity_details_endpoint.json")!

        networkClient.performRequest(with: url) { (result: Result<ActivityDetails, NetworkError>) in
            switch result {
            case .success(let content):
                completion(.success(content))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetchContactList(_ completion: @escaping (Result<[Contact], Error>) -> Void) {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/contact_list_endpoint.json")!

        networkClient.performRequest(with: url) { (result: Result<[Contact], NetworkError>) in
            switch result {
            case .success(let content):
                completion(.success(content))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func transferAmount(_ completion: @escaping (Result<TransferResult, Error>) -> Void) {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/transfer_successful_endpoint.json")!

        networkClient.performRequest(with: url) { (result: Result<TransferResult, NetworkError>) in
            switch result {
            case .success(let content):
                completion(.success(content))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetchUserProfile(_ completion: @escaping (Result<UserProfile, Error>) -> Void) {
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/user_profile_endpoint.json")!

        networkClient.performRequest(with: url) { (result: Result<UserProfile, NetworkError>) in
            switch result {
            case .success(let content):
                completion(.success(content))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
