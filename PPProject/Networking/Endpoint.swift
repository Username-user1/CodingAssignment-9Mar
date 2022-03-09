//
//  Endpoint.swift
//  PPProject
//
//  Created by Priyanka Dobhal on 09/03/22.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var baseURL: String { get}
    var path: String { get }
    var parameters: [URLQueryItem] { get }
}

