//
//  ViewController.swift
//  Cineni
//
//  Created by Daniel Ramos on 12/8/22.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, HomeView {
    @IBOutlet var tableView: UITableView!

    private var presenter: HomePresenter?
    private var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"

        print("Cargando viewDidLoad")
        presenter = homePresenterApiFactory(self)
        presenter?.getMovies()
        print("Termine de cargar las pelis")
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = movies[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func presentMovies(movies: [Movie]) {
        print("Should show the movies \(movies)")
        self.movies = movies

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func presentAlert(title _: String) {}
}
