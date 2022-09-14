//
//  MoviesEndpoint.swift
//  Movie
//
//  Created by Burak Nurçiçek on 15.09.2022.
//

enum MoviesEndpoint {
    case topRated
    case movieDetail(id: Int)
}

extension MoviesEndpoint: Endpoint {
    var path: String {
        switch self {
        case .topRated:
            return "/3/movie/top_rated"
        case .movieDetail(let id):
            return "/3/movie/\(id)"
        }
    }

    var method: RequestMethod {
        switch self {
        case .topRated, .movieDetail:
            return .get
        }
    }

    var header: [String: String]? {
        let accessToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMDE2MWQ2M2MwYzYyMzNiNTQ4NWVhMzc0NDFhZDliNSIsInN1YiI6IjYzMjI0NTY1ZGIxNTRmMDA5ODVmZTNiYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tX32a4SbTLaQUOabxvVOgcFRcJNiTsxT5RULo9ggMK0"
        switch self {
        case .topRated, .movieDetail:
            return [
                "Authorization": "Bearer \(accessToken)",
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }
    
    var body: [String: String]? {
        switch self {
        case .topRated, .movieDetail:
            return nil
        }
    }
}
