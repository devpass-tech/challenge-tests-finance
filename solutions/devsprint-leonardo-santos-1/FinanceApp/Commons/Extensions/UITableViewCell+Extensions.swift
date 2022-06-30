//
//  UITableViewCell+Extensions.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 02/03/22.
//

import UIKit

extension UITableViewCell {

    class func classIdentifier() -> String {
        guard let className = String(describing: self).components(separatedBy: ".").last else {
            return ""
        }

        return className
    }
}
