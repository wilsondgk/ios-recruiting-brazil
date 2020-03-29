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

final class MoviesListInteractor: MoviesListInteractorProtocol {
    
    private let presenter: MoviesListPresenterProtocol
    private let worker: MoviesListWorkerProtocol
    
    init(withPresenter presenter: MoviesListPresenterProtocol,
         andWorker worker: MoviesListWorkerProtocol) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func viewDidLoad() {
//        presenter.presentLoadingState()
        worker.getMoviesList(successCompletion: { [weak self] result in
            self?.presenter.presentMovies(result.results)
        }) { (error) in
            //todo: add error handler
        }
    }
}
