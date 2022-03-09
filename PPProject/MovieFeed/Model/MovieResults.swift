//
//  MovieResults.swift
//  PPProject
//
//  Created by Priyanka Dobhal on 09/03/22.
//

import Foundation

class MovieResults: Codable {
    var results: [Movie]
}

class Movie: Codable {
    var original_title: String?
    var overview: String?
    var poster_path: String?
    var release_date: String?
    var popularity: Double?
    var vote_average: Double?
    var imageData: Data?
}
