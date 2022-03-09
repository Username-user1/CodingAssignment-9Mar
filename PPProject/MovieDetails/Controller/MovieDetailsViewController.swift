//
//  MovieDetailsViewController.swift
//  PPProject
//
//  Created by Priyanka Dobhal on 09/03/22.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {
    private let viewModel: MovieDetailsViewModel
    private let movieDetailsView: MovieDetailsView
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        movieDetailsView = MovieDetailsView(frame: .zero)
        super.init(nibName: nil, bundle: nil)
        movieDetailsView.configureView(viewModel: viewModel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        navigationItem.title = viewModel.title
        view.backgroundColor = .white
        constructSubviewHierarchy()
    }

    private func constructSubviewHierarchy() {
        movieDetailsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(movieDetailsView)
        NSLayoutConstraint.activate([
            movieDetailsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieDetailsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            movieDetailsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            movieDetailsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
