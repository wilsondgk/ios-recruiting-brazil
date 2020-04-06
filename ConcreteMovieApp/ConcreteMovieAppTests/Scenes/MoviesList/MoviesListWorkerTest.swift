//
//  MoviesListWorkerTest.swift
//  ConcreteMovieAppTests
//
//  Created by Wilson Kim on 06/04/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import XCTest
@testable import ConcreteMovieApp

class MoviesListWorkerTests: XCTestCase {
    
    var worker: MoviesListWorker!
    var externalProviderMock: ExternalApiProviderMock!
    var localProviderMock: LocalApiProviderMock!
    let data = JsonMockProvider(fileName: "GeneralMovieResponseModel").getData()
    
    override func tearDown() {
        externalProviderMock = nil
        localProviderMock = nil
        worker = nil
    }

    func testGetMoviesListWithSuccess() {
        let shouldSuccess = true
        externalProviderMock = ExternalApiProviderMock(shouldSuccessRequest: shouldSuccess, withData: data)
        localProviderMock = LocalApiProviderMock(shouldSuccessRequest: shouldSuccess)
        worker = MoviesListWorker(withExternalProvider: externalProviderMock, andLocalProvider: localProviderMock)
        worker.getMoviesList(successCompletion: { (model) in
            XCTAssertTrue(shouldSuccess)
        }) { (error) in
            XCTFail()
        }
    }
    
    func testGetMoviesListWithError() {
        let shouldSuccess = false
        externalProviderMock = ExternalApiProviderMock(shouldSuccessRequest: shouldSuccess, withData: data)
        localProviderMock = LocalApiProviderMock(shouldSuccessRequest: shouldSuccess)
        worker = MoviesListWorker(withExternalProvider: externalProviderMock, andLocalProvider: localProviderMock)
        worker.getMoviesList(successCompletion: { (model) in
            XCTFail()
        }) { (error) in
            XCTAssertFalse(shouldSuccess)
        }
    }
    
    //    externalProviderMock = ExternalApiProviderMock(shouldSuccessRequest: true, withData: data)
    //    localProviderMock = LocalApiProviderMock(shouldSuccessRequest: true)
    //    worker = MoviesListWorker(withExternalProvider: externalProviderMock, andLocalProvider: localProviderMock)
    
    func testGetFavoriteMoviesWithSuccess() {
        let shouldSuccess = true
        externalProviderMock = ExternalApiProviderMock(shouldSuccessRequest: shouldSuccess, withData: data)
        localProviderMock = LocalApiProviderMock(shouldSuccessRequest: shouldSuccess)
        worker = MoviesListWorker(withExternalProvider: externalProviderMock, andLocalProvider: localProviderMock)
        worker.getFavoriteMoviesList(successCompletion: { (movies) in
            XCTAssertTrue(shouldSuccess)
        }) { (error) in
            XCTFail()
        }
    }
    
    func testGetFavoriteMoviesWithError() {
        let shouldSuccess = false
        externalProviderMock = ExternalApiProviderMock(shouldSuccessRequest: shouldSuccess, withData: data)
        localProviderMock = LocalApiProviderMock(shouldSuccessRequest: shouldSuccess)
        worker = MoviesListWorker(withExternalProvider: externalProviderMock, andLocalProvider: localProviderMock)
        worker.getFavoriteMoviesList(successCompletion: { (movies) in
            XCTFail()
        }) { (error) in
            XCTAssertFalse(shouldSuccess)
        }
    }
}
 
