//
//  SnapshotMockViewController.swift
//  FinanceAppTests
//
//  Created by Home on 16/05/22.
//

import Foundation
import UIKit

final class SnapshotMockViewController: UIViewController {
    func configureView(child: UIView) {
        view.addSubview(child)
        
        NSLayoutConstraint.activate([
            child.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            child.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            child.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
}
