//
//  TestingRootViewController.swift
//  CineniTests
//
//  Created by Daniel Ramos on 23/8/22.
//

import Foundation
import UIKit

class TestingRootViewController: UIViewController {
    override func loadView() {
        let label = UILabel()
        label.text = "Running Unit Tests..."
        label.textAlignment = .center
        label.textColor = .white

        view = label
    }
}
