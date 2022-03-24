//
//  HomeServiceProtocol.swift
//  Core
//
//  Created by Willian Policiano on 24/03/22.
//

import Foundation

public protocol HomeLoader {
    typealias Result = Swift.Result<Home, Error>
    
    func getHome(completion: @escaping (Result) -> Void)
}
