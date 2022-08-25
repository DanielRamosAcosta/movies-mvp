//
//  DownloadsViewController.swift
//  Cineni
//
//  Created by Daniel Ramos on 18/8/22.
//

import Swinject
import UIKit

class DownloadsViewController: UIViewController {
    public static func build(_: Resolver) -> DownloadsViewController {
        return DownloadsViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Downloads"
    }
}
