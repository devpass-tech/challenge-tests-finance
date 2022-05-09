//
//  HomeService.swift
//  FinanceApp
//
//  Created by Gustavo Soares on 05/05/22.
//

import Foundation

protocol HomeServiceProtocol {
    static func fetchHomeData(_ completion: @escaping (HomeData?) -> Void)
}
