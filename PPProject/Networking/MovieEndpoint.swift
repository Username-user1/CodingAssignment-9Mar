//
//  MovieEndpoint.swift
//  PPProject
//
//  Created by Priyanka Dobhal on 09/03/22.
//

import Foundation


enum MovieEndpoint: Endpoint {
    case getMovies

    var scheme: String {
        "https"
    }

    var baseURL: String {
        "api.themoviedb.org"
    }

    var path: String {
        switch self {
        case .getMovies:
            return "/3/movie/popular"
        }
    }

    var parameters: [URLQueryItem] {
        switch self {
        case .getMovies:
            return [URLQueryItem(name: "language", value: "en-US"),
                    URLQueryItem(name: "page", value: "1"),
                    URLQueryItem(name: "apiKey", value: "38a73d59546aa378980a88b645f487fc")]
        }
    }
}
