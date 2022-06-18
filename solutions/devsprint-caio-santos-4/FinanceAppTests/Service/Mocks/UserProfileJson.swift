//
//  UserProfileJson.swift
//  FinanceAppTests
//
//  Created by Vinicius dos Reis Morgado Brancalliao on 13/06/22.
//

import Foundation

let userProfileJson = """
{
    "name": "Irma Flores",
    "phone": "+55 (11) 99999-9999",
    "email": "irma@devpass.com.br",
    "address": "Rua Bela Cintra, 495",
    "account": {
        "agency": "0001",
        "account": "123456-7"
    }
}
""".data(using: .utf8)
