//
//  MoviesListInteractor.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 21/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import Foundation

protocol MoviesListPresenterProtocol {
    func presentLoadingState()
    func presentMovies(_ movies: [MovieResponseModel])
}

protocol MoviesListWorkerProtocol {
    func getMoviesList(successCompletion: @escaping (_ movies: GeneralMovieResponseModel) -> Void, failCompletion: @escaping (_ error: Error) -> Void)
}

protocol MoviesListNavigationProtocol: class {
    func showMovieDetailVC()
}

final class MoviesListInteractor: MoviesListInteractorProtocol {
    
    private let coordinator: MoviesListNavigationProtocol
    private let presenter: MoviesListPresenterProtocol
    private let worker: MoviesListWorkerProtocol
    private var response: GeneralMovieResponseModel?
    
    init(withCoordinator coordinator: MoviesListNavigationProtocol,
         withPresenter presenter: MoviesListPresenterProtocol,
         andWorker worker: MoviesListWorkerProtocol) {
        self.coordinator = coordinator
        self.presenter = presenter
        self.worker = worker
    }
    
    //MARK: MoviesListInteractorProtocol
    func viewDidLoad() {
//        presenter.presentLoadingState()
        worker.getMoviesList(successCompletion: { [weak self] result in
            self?.response = result
            self?.presenter.presentMovies(result.results)
        }) { (error) in
            //todo: add error handler
        }
    }
    
    func didClickInMovie(atIndex indexPath: IndexPath) {
        coordinator.showMovieDetailVC()
    }
}
