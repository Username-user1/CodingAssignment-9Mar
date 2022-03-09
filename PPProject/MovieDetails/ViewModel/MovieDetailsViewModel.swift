//
//  MovieDetailsViewModel.swift
//  PPProject
//
//  Created by Priyanka Dobhal on 09/03/22.
//

import Foundation

class MovieDetailsViewModel {
    var imageData: Data?
    var title: String?
    var releaseDate: String?
    var rating: String?
    var popularity: String?
    var overview: String?
    var overviewTitle = "Overview"
    var releaseDateTitle = "Release Date"
    var ratingTitle = "Rating"
    var popularityTitle = "Popularity"

    init(model: Movie) {
        self.imageData = model.imageData
        self.title = model.original_title
        self.releaseDate = model.release_date
        self.rating = "\(model.vote_average ?? 0.0)"
        self.popularity = "\(model.popularity ?? 0.0)"
        self.overview = model.overview
    }
}
