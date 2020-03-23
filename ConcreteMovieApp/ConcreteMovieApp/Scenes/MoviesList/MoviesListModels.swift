//
//  MoviesListModels.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 22/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import Foundation


class MovieViewModel {
    var id:Int64
    var averageRating:Double
    var genresIds:[Int]
    var originalTitle:String
    var backdropPath:String
    var isAdult:Bool
    var popularity:Double
    var posterPath:String
    var title:String
    var overview:String
    var originalLanguage:String
    var voteCount:Int64
    var releaseDate:Date
    var isVideo:Bool
    
    init(_id:Int64,
    _averageRating:Double,
    _genresIds:[Int],
    _originalTitle:String,
    _backdropPath:String,
    _isAdult:Bool,
    _popularity:Double,
    _posterPath:String,
    _title:String,
    _overview:String,
    _originalLanguage:String,
    _voteCount:Int64,
    _releaseDate:Date,
    _isVideo:Bool) {
        id = _id
        averageRating = _averageRating
        genresIds = _genresIds
        originalTitle = _originalTitle
        backdropPath = _backdropPath
        isAdult = _isAdult
        popularity = _popularity
        posterPath = _posterPath
        title = _title
        overview = _overview
        originalLanguage = _originalLanguage
        voteCount = _voteCount
        releaseDate = _releaseDate
        isVideo = _isVideo
    }
}

class GeneralMovieResponseModel: Codable {
    
    var totalPages:Int
    var totalResults:Int
    var currentPage:Int
    var results:[MovieResponseModel]
    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case currentPage = "page"
        case results = "results"
    }
    
    func getMoviesModel() -> [MovieViewModel] {
        var returnMovies:[MovieViewModel] = []
        for result in results {
            returnMovies.append(result.getMovieModel())
        }
        return returnMovies
    }
}

class MovieResponseModel: Codable {
    var id:Int64
    var averageRating:Double
    var genresIds:[Int]
    var originalTitle:String
    var backdropPath:String?
    var isAdult:Bool
    var popularity:Double
    var posterPath:String
    var title:String
    var overview:String
    var originalLanguage:String
    var voteCount:Int64
    var releaseDate:String
    var isVideo:Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case averageRating = "vote_average"
        case genresIds = "genre_ids"
        case originalTitle = "original_title"
        case backdropPath = "backdrop_path"
        case isAdult = "adult"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case title = "title"
        case overview = "overview"
        case originalLanguage = "original_language"
        case voteCount = "vote_count"
        case releaseDate = "release_date"
        case isVideo = "video"
    }
    
    func getMovieModel() -> MovieViewModel {
        return MovieViewModel(_id: id,
                              _averageRating: averageRating,
                              _genresIds: genresIds,
                              _originalTitle: originalTitle,
                              _backdropPath: backdropPath ?? "",
                              _isAdult: isAdult,
                              _popularity: popularity,
                              _posterPath: posterPath,
                              _title: title,
                              _overview: overview,
                              _originalLanguage: originalLanguage,
                              _voteCount: voteCount,
                              _releaseDate: Date.dateFrom(string: releaseDate) ?? Date(),
                              _isVideo: isVideo)
    }
}
