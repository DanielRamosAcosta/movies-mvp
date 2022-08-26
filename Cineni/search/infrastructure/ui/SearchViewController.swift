//
//  SearchViewController.swift
//  Cineni
//
//  Created by Daniel Ramos on 18/8/22.
//

import Swinject
import UIKit

class SearchViewController: UIViewController {
    let upComingTable: UITableView = {
        let table = UITableView()
        table.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        return table
    }()

    let searchController: UISearchController = {
        let search = UISearchController(searchResultsController: SerachResultsViewController())
        return search
    }()

    var upComingMovies: [Movie] = []

    private var presenter: SearchPresenter?

    public static func build(_: Resolver) -> SearchViewController {
        return SearchViewController()
    }

    public static func initCompleted(_ resolver: Resolver, _ upcomingViewController: SearchViewController) {
        upcomingViewController.setPresenter(resolver.resolve(SearchPresenter.self)!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationItem.searchController = searchController

        view.addSubview(upComingTable)
        upComingTable.delegate = self
        upComingTable.dataSource = self

        presenter?.loadTopSearchedMovies()
        searchController.searchResultsUpdater = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upComingTable.frame = view.bounds
    }

    func setPresenter(_ presenter: SearchPresenter) {
        self.presenter = presenter
    }
}

extension SearchViewController: SearchViewDelegate {
    func presentTopSearchedMovies(_ movies: [Movie]) {
        upComingMovies = movies

        DispatchQueue.main.async {
            self.upComingTable.reloadData()
        }
    }

    func presentSearchResults(_ movies: [Movie]) {
        DispatchQueue.main.async {
            guard let controller = self.searchController.searchResultsController as? SerachResultsViewController else {
                return
            }

            controller.presentMovies(movies)
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        upComingMovies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieTableViewCell.identifier,
            for: indexPath
        ) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        let movie = upComingMovies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 120
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        presenter?.loadSearch(query: searchController.searchBar.text ?? "")
    }
}
