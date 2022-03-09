//
//  MovieCellViewModel.swift
//  PPProject
//
//  Created by Priyanka Dobhal on 09/03/22.
//

import Foundation

class MovieCellViewModel {
    let titleLabel: String?
    let description: String?
    var imageData: Data?
    let poster_path: String?
    init(movie: Movie) {
        self.titleLabel = movie.original_title
        self.description = movie.overview
        self.imageData = movie.imageData
        self.poster_path = movie.poster_path
    }

    //todo: inject api client, instead of using directly
    func fetchImage(completion: @escaping (Data) -> Void) {
        guard let imageData = imageData else {
            guard let imagePath = poster_path else { return }
            //use endpoint protocol here
            let imageURL = "https://image.tmdb.org/t/p/w500\(imagePath)"
            APIClient().fetchImage(urlString: imageURL) { (result) in
                switch result {
                case .success(let data):
                    self.imageData = data
                    completion(data)
                case .failure:
                    //todo: add error handling here
                    break
                }
            }
            return
        }
        completion(imageData)
    }
}
