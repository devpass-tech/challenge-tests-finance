//
//  HttpClient.swift
//  Core
//
//  Created by Willian Policiano on 22/03/22.
//

import Foundation

protocol HttpClient {
    typealias Result = Swift.Result<(code: Int, data: Data), Error>

    func request(url: URL, completion: @escaping (Result) -> Void)
}
