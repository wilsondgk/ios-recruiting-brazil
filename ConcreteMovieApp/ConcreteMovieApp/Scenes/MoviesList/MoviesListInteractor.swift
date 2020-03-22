//
//  MoviesListInteractor.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 21/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import Foundation

protocol MoviesListPresenterProtocol {
    
}

protocol MoviesListWorkerProtocol {
    
}

final class MoviesListInteractor: MoviesListInteractorProtocol {
    
    private let presenter: MoviesListPresenterProtocol
    private let worker: MoviesListWorkerProtocol
    
    init(withPresenter presenter: MoviesListPresenterProtocol,
         andWorker worker: MoviesListWorkerProtocol) {
        self.presenter = presenter
        self.worker = worker
    }
}
