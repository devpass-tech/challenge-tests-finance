//
//  ContactListMock.swift
//  FinanceAppTests
//
//  Created by Leonardo Cunha on 21/06/22.
//

import Foundation
@testable import FinanceApp

final class ContactListMock: NetworkClientProtocol {
    
    func performRequest(with url: URL, completion: @escaping (Data?) -> ()) {
        let data = """
[
    {
        "name": "Ronald Robertson",
        "phone": "+55 (11) 99999-9999"
    },
    {
        "name": "Johnny Watson",
        "phone": "+55 (11) 99999-9999"
    }
]
""".data(using: .utf8)
        completion(data)
    }
}


