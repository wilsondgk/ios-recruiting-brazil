//
//  MoviesListPresenterTests.swift
//  ConcreteMovieAppTests
//
//  Created by Wilson Kim on 05/04/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import XCTest
@testable import ConcreteMovieApp

class MoviesListPresenterTests: XCTestCase {

    var presenter: MoviesListPresenter!
    var viewSpy: MoviesListViewSpy!
    
    override func setUp() {
        presenter = MoviesListPresenter()
        viewSpy = MoviesListViewSpy()
        presenter.setView(viewSpy)
    }

    override func tearDown() {
        presenter = nil
        viewSpy = nil
    }
    
    func testShowLoading() {
        presenter.presentLoadingState()
        XCTAssertTrue(viewSpy.didCallShowLoading)
    }
    
    func testShowError() {
        presenter.presentError(ErrorMock())
        XCTAssertTrue(viewSpy.didCallShowError)
    }
    
    func testPresentMovies() {
        presenter.presentMovies([], withFavoriteMovies: [:])
        XCTAssertTrue(viewSpy.didCallSetNormalLayout)
        XCTAssertTrue(viewSpy.didCallUpdateMovies)
    }
}

class MoviesListViewSpy: MoviesListViewProtocol {
    
    var didCallShowLoading = false
    var didCallShowError = false
    var didCallSetNormalLayout = false
    var didCallUpdateMovies = false
    
    func showLoading(withMessage message: String) {
        didCallShowLoading = true
    }
    
    func showError(_ error: Error?) {
        didCallShowError = true
    }
    
    func setNormalLayout() {
        didCallSetNormalLayout = true
    }
    
    func updateMovies(withMoviesViewModel viewModels: [DefaultMovieViewModel]) {
        didCallUpdateMovies = true
    }
}
