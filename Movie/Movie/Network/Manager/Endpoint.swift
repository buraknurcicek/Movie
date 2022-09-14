//
//  Endpoint.swift
//  Movie
//
//  Created by Burak Nurçiçek on 15.09.2022.
//

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }
    var host: String {
        return "api.themoviedb.org"
    }
}
