//
//  HomeDataJson.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 10/06/22.
//

import Foundation

let homeDataJson = """
{
  "balance": 15459.27,
  "savings": 1000.0,
  "spending": 500.0,
  "activity": [
    {
      "name": "Mall",
      "price": 100.0,
      "time": "8:57 AM"
    },
    {
      "name": "Food Court",
      "price": 100.0,
      "time": "8:57 AM"
    },
    {
      "name": "Oceanic Airlines",
      "price": 100.0,
      "time": "8:57 AM"
    },
    {
      "name": "Gym Membership",
      "price": 100.0,
      "time": "8:57 AM"
    },
    {
      "name": "Private Transport",
      "price": 100.0,
      "time": "8:57 AM"
    }
  ]
}
""".data(using: .utf8)
