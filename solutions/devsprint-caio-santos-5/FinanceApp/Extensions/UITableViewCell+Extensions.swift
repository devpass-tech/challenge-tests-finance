//
//  UITableViewCell+Extensions.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 02/03/22.
//

import UIKit

extension UITableViewCell {
    class func classIdentifier() -> String {
        return String(describing: self)
    }
}
