//
//  MoviesListModels.swift
//  ConcreteMovieApp
//
//  Created by Wilson Kim on 22/03/20.
//  Copyright © 2020 Wilson Kim. All rights reserved.
//

import Foundation

struct GeneralMovieResponseModel: Codable {
    
    var totalPages: Int
    var totalResults: Int
    var currentPage: Int
    var results: [MovieResponseModel]
    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case currentPage = "page"
        case results = "results"
    }
}

struct MovieResponseModel: Codable {
    var id: Int64
    var title: String
    var isFavorite: Bool? = false
//    var averageRating: Double
//    var genresIds: [Int]
//    var originalTitle: String
//    var backdropPath: String?
//    var isAdult: Bool
//    var popularity: Double
//    var posterPath: String
//    var overview: String
//    var originalLanguage: String
//    var voteCount: Int64
//    var releaseDate: String
//    var isVideo: Bool
    
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case title = "title"
//        case averageRating = "vote_average"
//        case genresIds = "genre_ids"
//        case originalTitle = "original_title"
//        case backdropPath = "backdrop_path"
//        case isAdult = "adult"
//        case popularity = "popularity"
//        case posterPath = "poster_path"
//        case overview = "overview"
//        case originalLanguage = "original_language"
//        case voteCount = "vote_count"
//        case releaseDate = "release_date"
//        case isVideo = "video"
//    }
}
