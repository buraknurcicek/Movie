//
//  MainViewModel.swift
//  Movie
//
//  Created by Burak Nurçiçek on 14.09.2022.
//

import UIKit

protocol MainViewModelDelegate: AnyObject {
    func bind(with models: [MovieCell.ViewModel])
    func completedWithError()
}

final class MainViewModel {
    
    weak var delegate: MainViewModelDelegate?
    weak var coordinator: AppCoordinator?
    
    private let movieRepository: MovieRepositoryProtocol
    
    init(movieRepository: MovieRepositoryProtocol = MovieRepository()) {
        self.movieRepository = movieRepository
    }
    
    func fetchMovies() {
        LoadingManager.shared.showLoading()
        Task(priority: .background) {
            let result = await movieRepository.getTopRated()
            LoadingManager.shared.hideLoading()
            switch result {
            case .success(let topRated):
                handle(with: topRated.results)
            case .failure(_):
                delegate?.completedWithError()
            }
        }
    }
    
    private func getCellViewModels(with movies: [Movie]) -> [MovieCell.ViewModel] {
        let cellViewModels = movies.map { movie -> MovieCell.ViewModel in
            let viewModel = MovieCell.ViewModel(imageURL: movie.imageUrl, title: movie.title, genre: movie.genre)
            return viewModel
        }
        return cellViewModels
    }
    
    private func handle(with movies: [Movie]) {
        delegate?.bind(with: getCellViewModels(with: movies))
    }
}
