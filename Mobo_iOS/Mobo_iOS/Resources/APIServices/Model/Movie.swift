//
//  Movie.swift
//  boxoffice
//
//  Created by Cho on 16/12/2018.
//  Copyright © 2018 Cho. All rights reserved.
//

import Foundation

struct ListResponse: Codable {
    let status: Int
    let message: String
    let results: Movie
    
    enum CodingKeys: String, CodingKey {
        case status, message
        case results = "data"
    }
    
}

struct Movie: Codable {
    let userIdx: Int
    let matchingState: Int
    let randMovie: [movieInfo]
    let reserveMovie: [reserveMovieInfo]
    let reserveDate: [reserveDateInfo]
}

struct movieInfo: Codable {
    let id: Int
    let thumnailImageURL: String
    let title: String
    let userRating: Float
    let movieRuntime: String
    let movieGenre: String
    
    enum CodingKeys: String, CodingKey {
        case id = "movieIdx"
        case thumnailImageURL = "movieImg"
        case title = "movieName"
        case userRating = "movieScore"
        case movieRuntime = "movieRuntime"
        case movieGenre = "movieGenre"
    }
}

struct reserveMovieInfo: Codable {
    
    let id: Int
    let thumnailImageURL: String
    let title: String
    let userRating: Double
    
    enum CodingKeys: String, CodingKey {
        case id = "movieIdx"
        case thumnailImageURL = "movieImg"
        case title = "movieName"
        case userRating = "movieScore"
    }
}

struct reserveDateInfo: Codable {
    
    let reservationDate: String
    let reservationWeekday: String
    let reservationTime: [Int]
}
