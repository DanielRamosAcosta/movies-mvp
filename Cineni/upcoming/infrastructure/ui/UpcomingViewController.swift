//
//  UpcomingViewController.swift
//  Cineni
//
//  Created by Daniel Ramos on 18/8/22.
//

import Swinject
import UIKit

class UpcomingViewController: UIViewController {
    let upComingTable: UITableView = {
        let table = UITableView()
        table.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        return table
    }()

    var upComingMovies: [Movie] = []

    private var presenter: UpcomingPresenter?

    public static func build(_: Resolver) -> UpcomingViewController {
        return UpcomingViewController()
    }

    public static func initCompleted(_ resolver: Resolver, _ upcomingViewController: UpcomingViewController) {
        upcomingViewController.setPresenter(resolver.resolve(UpcomingPresenter.self)!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always

        view.addSubview(upComingTable)
        upComingTable.delegate = self
        upComingTable.dataSource = self

        presenter?.loadUpcomingMovies()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upComingTable.frame = view.bounds
    }

    func setPresenter(_ presenter: UpcomingPresenter) {
        self.presenter = presenter
    }
}

extension UpcomingViewController: UpcomingViewDelegate {
    func presentMovies(_ movies: [Movie]) {
        upComingMovies = movies

        DispatchQueue.main.async {
            self.upComingTable.reloadData()
        }
    }
}

extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource {
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
