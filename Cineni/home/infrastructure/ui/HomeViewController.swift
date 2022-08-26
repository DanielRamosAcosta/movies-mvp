//
//  HomeViewController.swift
//  Cineni
//
//  Created by Daniel Ramos on 18/8/22.
//

import Combine
import Swinject
import UIKit

enum Sections: Int {
    case trendingMovies = 0
    case trendingTv = 1
    case popular = 2
    case upcomingMovies = 3
    case topRated = 4
}

class HomeViewController: UIViewController {
    let sectionTitles = [
        "trendingMovies",
        "trendingTVShows",
        "Popular",
        "Upcoming Movies",
        "Top rated",
    ]
    private var trendingMovies: [Movie] = []
    private var trendingTVShows: [TVShow] = []
    private var popularMovies: [Movie] = []
    private var upcomingMovies: [Movie] = []
    private var topRatedMovies: [Movie] = []

    private var presenter: HomePresenter?
    private var localizer: Localizer?

    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    public static func build(_: Resolver) -> HomeViewController {
        return HomeViewController()
    }

    public static func initCompleted(_ resolver: Resolver, _ homeViewController: HomeViewController) {
        homeViewController.setPresenter(resolver.resolve(HomePresenter.self)!)
        homeViewController.setLocalizer(resolver.resolve(Localizer.self)!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)

        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self

        configureNavBar()

        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView

        presenter?.loadTrendingMovies()
        presenter?.loadTrendingTVShows()
        presenter?.loadPopularMovies()
        presenter?.loadUpcomingMovies()
        presenter?.loadTopRatedMovies()
    }
    
    public func setPresenter(_ presenter: HomePresenter) {
        self.presenter = presenter
    }
    
    public func setLocalizer(_ localizer: Localizer) {
        self.localizer = localizer
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }

    private func configureNavBar() {
        let image = UIImage(named: "logo")?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: image,
            landscapeImagePhone: image,
            style: .done,
            target: self,
            action: nil
        )
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil),
        ]
        navigationController?.navigationBar.tintColor = .white
    }
}

extension HomeViewController: HomeViewDelegate {
    func presentTrendingMovies(_ trendingMovies: [Movie]) {
        self.trendingMovies = trendingMovies

        DispatchQueue.main.async {
            self.homeFeedTable.reloadData()
        }
    }

    func presentTrendingTVShows(_ trendingTVShows: [TVShow]) {
        self.trendingTVShows = trendingTVShows

        DispatchQueue.main.async {
            self.homeFeedTable.reloadData()
        }
    }

    func presentPopularMovies(_ movies: [Movie]) {
        popularMovies = movies

        DispatchQueue.main.async {
            self.homeFeedTable.reloadData()
        }
    }

    func presentUpcomingMovies(_ movies: [Movie]) {
        upcomingMovies = movies

        DispatchQueue.main.async {
            self.homeFeedTable.reloadData()
        }
    }

    func presentTopRatedMovies(_ movies: [Movie]) {
        topRatedMovies = movies

        DispatchQueue.main.async {
            self.homeFeedTable.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        return sectionTitles.count
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CollectionViewTableViewCell.identifier,
            for: indexPath
        ) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }

        switch indexPath.section {
        case Sections.trendingMovies.rawValue:
            cell.configure(with: trendingMovies)
        case Sections.trendingTv.rawValue:
            cell.configure(with: trendingTVShows)
        case Sections.popular.rawValue:
            cell.configure(with: popularMovies)
        case Sections.upcomingMovies.rawValue:
            cell.configure(with: upcomingMovies)
        case Sections.topRated.rawValue:
            cell.configure(with: topRatedMovies)
        default:
            print("Fallback \(indexPath.section)")
            return cell
        }

        return cell
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_: UITableView, heightForHeaderInSection _: Int) -> CGFloat {
        return 40
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset

        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }

    func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return localizer?.translate(.trendingMovies)
        }
        if (section == 1) {
            return localizer?.translate(.trendingTvShows)
        }
        
        return sectionTitles[section]
    }

    func tableView(_: UITableView, willDisplayHeaderView view: UIView, forSection _: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: 0, y: 0, width: header.bounds.origin.y, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalized
    }
}
