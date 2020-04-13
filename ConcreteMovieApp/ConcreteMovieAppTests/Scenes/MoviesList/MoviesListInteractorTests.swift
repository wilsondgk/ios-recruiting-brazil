//
//  MoviesListInteractorTests.swift
//  ConcreteMovieAppTests
//
//  Created by Wilson Kim on 05/04/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import XCTest
@testable import ConcreteMovieApp

class MoviesListInteractorTests: XCTestCase {
    
    var interactor: MoviesListInteractor!
    var coordinatorSpy: MoviesListCoordinatorSpy!
    var presenterSpy: MoviesListPresenterSpy!
    var workerSpy: MoviesListWorkerSpy!
    var moviesExpectation: XCTestExpectation!
    var favoriteExpectation: XCTestExpectation!
    override func setUp() {
        coordinatorSpy = MoviesListCoordinatorSpy()
        presenterSpy = MoviesListPresenterSpy()
        moviesExpectation = XCTestExpectation(description: "movieslistexpectation")
        favoriteExpectation = XCTestExpectation(description: "favoriteexpectation")
        workerSpy = MoviesListWorkerSpy(withMoviesListExpectation: moviesExpectation,
                                        andFavoriteMoviesExpectation: favoriteExpectation)
        interactor = MoviesListInteractor(withCoordinator: coordinatorSpy,
                                          withPresenter: presenterSpy,
                                          andWorker: workerSpy)
    }
    
    override func tearDown() {
        coordinatorSpy = nil
        presenterSpy = nil
        workerSpy = nil
        interactor = nil
    }
    
    func testInteractorViewDidLoadWithSuccess() {
        workerSpy.success = true
        interactor.viewDidLoad()
        wait(for: [moviesExpectation, favoriteExpectation], timeout: 10.0)
        XCTAssertTrue(presenterSpy.didCallPresentLoadingState)
        XCTAssertTrue(workerSpy.didCallMoviesListCallWithSuccess)
        XCTAssertTrue(workerSpy.didCallFavoriteMoviesWithSuccess)
        XCTAssertFalse(workerSpy.didCallFavoriteMoviesWithError)
        XCTAssertFalse(workerSpy.didCallMoviesListCallWithError)
        XCTAssertFalse(presenterSpy.didCallPresentError)
    }
    
    func testInteractorViewDidLoadWithError() {
        workerSpy.success = false
        interactor.viewDidLoad()
        wait(for: [favoriteExpectation], timeout: 10.0)
        XCTAssertTrue(presenterSpy.didCallPresentLoadingState)
        XCTAssertFalse(workerSpy.didCallMoviesListCallWithSuccess)
        XCTAssertFalse(workerSpy.didCallFavoriteMoviesWithSuccess)
        XCTAssertTrue(workerSpy.didCallFavoriteMoviesWithError)
        XCTAssertTrue(presenterSpy.didCallPresentError)
    }
    
    func testReloadFavoriteMoviesWithSuccess() {
        workerSpy.success = true
        interactor.reloadFavoriteMovies()
        wait(for: [favoriteExpectation], timeout: 10.0)
        XCTAssertTrue(presenterSpy.didCallPresentLoadingState)
        XCTAssertTrue(workerSpy.didCallFavoriteMoviesWithSuccess)
        XCTAssertTrue(presenterSpy.didCallPresentMovies)
        XCTAssertFalse(workerSpy.didCallFavoriteMoviesWithError)
    }
    
    func testReloadFavoriteMoviesWithError() {
        workerSpy.success = false
        interactor.reloadFavoriteMovies()
        wait(for: [favoriteExpectation], timeout: 10.0)
        XCTAssertTrue(presenterSpy.didCallPresentLoadingState)
        XCTAssertFalse(presenterSpy.didCallPresentMovies)
        XCTAssertTrue(presenterSpy.didCallPresentError)
    }
    
    func testDidClickInMovie() {
        workerSpy.success = true
        interactor.viewDidLoad()
        wait(for: [moviesExpectation, favoriteExpectation], timeout: 10.0)
        interactor.didClickInMovie(atIndex: IndexPath(row: 0, section: 0))
        XCTAssertTrue(coordinatorSpy.didCallShowMovieDetailVC)
    }
}

class MoviesListCoordinatorSpy: MoviesListNavigationProtocol {
    
    var didCallShowMovieDetailVC = false
    
    func showMovieDetailVC(fromMovie movie: MovieResponseModel, isFavorite: Bool) {
        didCallShowMovieDetailVC = true
    }
}

class MoviesListPresenterSpy: MoviesListPresenterProtocol {
    
    var didCallPresentLoadingState = false
    var didCallPresentError = false
    var didCallPresentMovies = false
    
    func presentLoadingState() {
        didCallPresentLoadingState = true
    }
    
    func presentError(_ error: Error?) {
        didCallPresentError = true
    }
    
    func presentMovies(_ movies: [MovieResponseModel], withFavoriteMovies favoriteMovies: [Int64 : Bool?]) {
        didCallPresentMovies = true
    }
}

class MoviesListWorkerSpy: MoviesListWorkerProtocol {
    
    let moviesListexpectation: XCTestExpectation
    let favoriteMoviesExpectation: XCTestExpectation
    var success: Bool = false
    var didCallMoviesListCallWithSuccess = false
    var didCallMoviesListCallWithError = false
    var didCallFavoriteMoviesWithSuccess = false
    var didCallFavoriteMoviesWithError = false
    
    init(withMoviesListExpectation moviesListexpectation: XCTestExpectation,
         andFavoriteMoviesExpectation favoriteMoviesExpectation: XCTestExpectation) {
        self.moviesListexpectation = moviesListexpectation
        self.favoriteMoviesExpectation = favoriteMoviesExpectation
    }
    
    func getFavoriteMoviesList(successCompletion: @escaping ([MovieResponseModel]) -> Void, failCompletion: @escaping (Error) -> Void) {
        if success {
            didCallFavoriteMoviesWithSuccess = true
            successCompletion([])
            favoriteMoviesExpectation.fulfill()
            return
        }
        didCallFavoriteMoviesWithError = true
        failCompletion(ErrorMock())
        favoriteMoviesExpectation.fulfill()
    }
    
    func getMoviesList(fromPage page: Int, successCompletion: @escaping (GeneralMovieResponseModel) -> Void, failCompletion: @escaping (Error) -> Void) {
        let movie = MovieResponseModel(id: 0, title: "", averageRating: 1.0, releaseDate: "", overview: "", posterPath: "")
        let response = GeneralMovieResponseModel(totalPages: 0, totalResults: 0, currentPage: 0, results: [movie])
        if success {
            self.didCallMoviesListCallWithSuccess = true
            successCompletion(response)
            moviesListexpectation.fulfill()
            return
        }
        self.didCallMoviesListCallWithError = true
        failCompletion(ErrorMock())
        moviesListexpectation.fulfill()
    }
}

struct ErrorMock: Error {
    
}
