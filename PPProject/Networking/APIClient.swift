//
//  APIClient.swift
//  PPProject
//
//  Created by Priyanka Dobhal on 09/03/22.
//

import Foundation

enum NetworkingError: Error {
    case GenericFailure
    case NetworkFailure
    case DecodingFailure
}

protocol APIClientActions: AnyObject {
    func fetchMovies(completion: @escaping  (Result<[Movie], Error>) ->Void)
    func fetchImage(urlString: String, completion: @escaping  (Result<Data, Error>) ->Void)
}

//todo: create a generic networking manager and api client should utilise that generic class for networking
//todo: store api key securely like in xcconfig
class APIClient: APIClientActions {
    let urlSession = URLSession(configuration: .default)
    var dataTask: URLSessionTask?
    //todo: use Movie endpoint here, instead of directly using url string
    let baseURL = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=38a73d59546aa378980a88b645f487fc&language=en-US&page=1")

    func fetchMovies(completion: @escaping  (Result<[Movie], Error>) ->Void) {
        guard let url = baseURL else {
            completion(.failure(NetworkingError.GenericFailure))
            return
        }
        dataTask = urlSession.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(NetworkingError.NetworkFailure))
                return
            }
            do {
                let movies = try JSONDecoder().decode(MovieResults.self, from: data)
                completion(.success(movies.results))
            } catch {
                completion(.failure(NetworkingError.DecodingFailure))
            }
        })
        dataTask?.resume()
    }

    func fetchImage(urlString: String, completion: @escaping  (Result<Data, Error>) ->Void) {
        guard let imageURL = URL(string: urlString) else { return }
        dataTask = urlSession.dataTask(with: imageURL, completionHandler: { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkingError.GenericFailure))
                return
            }
            completion(.success(data))
        })
        dataTask?.resume()
    }
}

