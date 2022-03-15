//
//  FinanceService.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol FinanceServiceProtocol {

    func fetchHomeData(_ completion: @escaping (HomeData?) -> Void)
    func fetchActivityDetails(_ completion: @escaping (ActivityDetails?) -> Void)
    func fetchContactList(_ completion: @escaping ([Contact]?) -> Void)
    func transferAmount(_ completion: @escaping (TransferResult?) -> Void)
    func fetchUserProfile(_ completion: @escaping (UserProfile?) -> Void)
}

class FinanceService: FinanceServiceProtocol {

    let networkClient: NetworkClientProtocol

    init(networkClient: NetworkClientProtocol) {

        self.networkClient = networkClient
    }

    func fetchHomeData() {

    }

    func fetchActivityDetails() {

    }

    func fetchContactList() {

    }

    func transferAmount() {

    }

    func fetchUserProfile() {

    }
}
