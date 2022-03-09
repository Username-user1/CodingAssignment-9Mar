//
//  MovieViewModel.swift
//  PPProject
//
//  Created by Priyanka Dobhal on 09/03/22.
//

import Foundation

class MovieViewModel {
    private let apiClient: APIClientActions
    var movies = [Movie]()

    init(apiClient: APIClientActions) {
        self.apiClient = apiClient
    }
    func fetchMovieResults(completion: @escaping ()-> Void) {
        apiClient.fetchMovies { result in
            switch result {
            case .success(let results):
                self.movies = results
                completion()
            case .failure:
                //handle failure
                break
            }
        }
    }
}
