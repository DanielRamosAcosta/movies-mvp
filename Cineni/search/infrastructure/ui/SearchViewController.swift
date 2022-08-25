//
//  SearchViewController.swift
//  Cineni
//
//  Created by Daniel Ramos on 18/8/22.
//

import Swinject
import UIKit

class SearchViewController: UIViewController {
    public static func build(_: Resolver) -> SearchViewController {
        return SearchViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Top Search"
    }
}
