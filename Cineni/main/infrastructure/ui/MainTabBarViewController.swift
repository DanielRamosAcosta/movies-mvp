//
//  MainTabBarViewController.swift
//  Cineni
//
//  Created by Daniel Ramos on 18/8/22.
//

import Swinject
import UIKit

class MainTabBarViewController: UITabBarController {
    let homeViewController: HomeViewController
    let upcomingViewController: UpcomingViewController
    let searchViewController: SearchViewController
    let downloadsViewController: DownloadsViewController
    let localizer: Localizer

    static func build(_ resolver: Resolver) -> MainTabBarViewController {
        let homeViewController = resolver.resolve(HomeViewController.self)!
        let upcomingViewController = resolver.resolve(UpcomingViewController.self)!
        let searchViewController = resolver.resolve(SearchViewController.self)!
        let downloadsViewController = resolver.resolve(DownloadsViewController.self)!
        let localizer = resolver.resolve(Localizer.self)!

        return MainTabBarViewController(
            homeViewController: homeViewController,
            upcomingViewController: upcomingViewController,
            searchViewController: searchViewController,
            downloadsViewController: downloadsViewController,
            localizer: localizer
        )
    }

    init(
        homeViewController: HomeViewController,
        upcomingViewController: UpcomingViewController,
        searchViewController: SearchViewController,
        downloadsViewController: DownloadsViewController,
        localizer: Localizer
    ) {
        self.homeViewController = homeViewController
        self.upcomingViewController = upcomingViewController
        self.searchViewController = searchViewController
        self.downloadsViewController = downloadsViewController
        self.localizer = localizer
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow

        let vc1 = UINavigationController(rootViewController: homeViewController)
        let vc2 = UINavigationController(rootViewController: upcomingViewController)
        let vc3 = UINavigationController(rootViewController: searchViewController)
        let vc4 = UINavigationController(rootViewController: downloadsViewController)

        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")

        vc1.title = "Home"
        vc2.title = "Coming Soon"
        vc3.title = localizer.translate(.search)
        vc4.title = "Downloads"

        tabBar.tintColor = .label

        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
}
