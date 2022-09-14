//
//  MovieRepository.swift
//  Movie
//
//  Created by Burak Nurçiçek on 14.09.2022.
//

import Foundation

protocol MovieRepositoryProtocol {
    
    func getTopRated() async -> Result<TopRated, RequestError>
    func getMovieDetail(id: Int) async -> Result<Movie, RequestError>
}

final class MovieRepository: NetworkManager, MovieRepositoryProtocol {

    func getTopRated() async -> Result<TopRated, RequestError> {
        return await sendRequest(endpoint: MoviesEndpoint.topRated, responseModel: TopRated.self)
    }
    
    func getMovieDetail(id: Int) async -> Result<Movie, RequestError> {
        return await sendRequest(endpoint: MoviesEndpoint.movieDetail(id: id), responseModel: Movie.self)
    }
}
