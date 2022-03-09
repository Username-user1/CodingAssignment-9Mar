//
//  MainCoordinator.swift
//  PPProject
//
//  Created by Priyanka Dobhal on 09/03/22.
//

import Foundation
import UIKit

protocol MainCoordinatorActions: AnyObject {
    func showMovieDetails(viewModel: MovieDetailsViewModel)
}

class MainCoordinator: MainCoordinatorActions {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = MovieViewModel(apiClient: APIClient())
        let vc = MovieTableViewController(viewModel: viewModel)
        vc.delegate = self
        navigationController.pushViewController(vc, animated: false)
    }

    func showMovieDetails(viewModel: MovieDetailsViewModel) {
        let vc = MovieDetailsViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}
