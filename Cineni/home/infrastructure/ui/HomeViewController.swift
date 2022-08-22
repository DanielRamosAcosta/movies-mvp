//
//  HomeViewController.swift
//  Cineni
//
//  Created by Daniel Ramos on 18/8/22.
//

import UIKit
import Combine
import Swinject

enum Sections: Int {
    case TrendingMovies = 0
    case TrendingTv = 1
    case Popular = 2
    case UpcomingMovies = 3
    case TopRated = 4
}

class HomeViewController: UIViewController, HomeViewDelegate {
    let sectionTitles = [
        "Trending Movies",
        "Trending TV",
        "Popular",
        "Upcoming Movies",
        "Top rated",
    ]
    private var movies: [MovieDomain] = []
    
    private var presenter: HomePresenter?


    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    public func setPresenter(presenter: HomePresenter) {
        self.presenter = presenter
    }
    
    public static func build(_ resolver: Resolver) -> HomeViewController {
        return HomeViewController()
    }
    
    public static func initCompleted(_ resolver: Resolver, _ homeViewController: HomeViewController) {
        homeViewController.setPresenter(presenter: resolver.resolve(HomePresenter.self)!)
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
        
        presenter?.getMovies()
    }
    
    func presentTrendingMovies(_ movies: [MovieDomain]) {
        self.movies = movies
        
        DispatchQueue.main.async {
            self.homeFeedTable.reloadData()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }

    private func configureNavBar() {
        let image = UIImage(named: "logo")?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, landscapeImagePhone: image, style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil),
        ]
        navigationController?.navigationBar.tintColor = .white
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
 
        if (indexPath.section == 0) {
            cell.configure(with: movies)
        } else {
            cell.configure(with: [])
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: 0, y: 0, width: header.bounds.origin.y, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalized
    }
}