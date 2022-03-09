//
//  MovieViewController.swift
//  PPProject
//
//  Created by Priyanka Dobhal on 09/03/22.
//

import Foundation
import UIKit

//todo: add pagination support
class MovieTableViewController: UIViewController {
    private let tableView = UITableView()
    private let viewModel: MovieViewModel
    weak var delegate: MainCoordinatorActions?
    static let movieCell = "movieCell"

    init(viewModel: MovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieViewCell.self, forCellReuseIdentifier: MovieTableViewController.movieCell)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        constructSubviewHierarchy()
        fetchMovies()
    }

    private func fetchMovies() {
        viewModel.fetchMovieResults { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    private func constructSubviewHierarchy() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension MovieTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieTableViewController.movieCell,
            for: indexPath) as? MovieViewCell else {
            fatalError()
        }
        cell.configure(viewModel: viewModel.movies[indexPath.row])
        cell.layoutIfNeeded()
        return cell
    }
}

extension MovieTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movieDetailsViewModel = MovieDetailsViewModel(model: viewModel.movies[indexPath.row])
        delegate?.showMovieDetails(viewModel: movieDetailsViewModel)
    }
}
