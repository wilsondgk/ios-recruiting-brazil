//
//  MovieDetailInteractor.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 31/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import Foundation

protocol MovieDetailPresenterProtocol {
    
}

protocol MovieDetailWorkerProtocol {
    
}

final class MovieDetailInteractor: MovieDetailInteractorProtocol {
    
    private let presenter: MovieDetailPresenterProtocol
    private let worker: MovieDetailWorkerProtocol
    
    init(withPresenter presenter: MovieDetailPresenterProtocol, andWorker worker: MovieDetailWorkerProtocol) {
        self.presenter = presenter
        self.worker = worker
    }
}


