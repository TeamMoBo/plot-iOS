////
////  Movie.swift
////  boxoffice
////
////  Created by Cho on 16/12/2018.
////  Copyright © 2018 Cho. All rights reserved.
////
//
//import Foundation
//
//struct TicketListResponse: Codable {
//    let status: Int
//    let message: String
//    let results: TicketingMovie
//    
//    enum CodingKeys: String, CodingKey {
//        case status, message
//        case results = "data"
//    }
//}
//
//struct TicketingMovie: Codable {
//    let movieReleaseStatus: Int
//    let movieData: [movieTicketInfo]
//    
//}
//
//struct movieTicketInfo: Codable {
//    let id: Int
//    let thumnailImageURL: String
//    let title: String
//    let userRating: Float
//    
//    enum CodingKeys: String, CodingKey {
//        case id = "movieIdx"
//        case thumnailImageURL = "movieImg"
//        case title = "movieName"
//        case userRating = "movieScore"
//    }
//}
