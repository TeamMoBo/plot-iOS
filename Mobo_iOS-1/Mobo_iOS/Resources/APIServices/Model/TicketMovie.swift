//
//  TicketMovie.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2020/01/02.
//  Copyright © 2020 조경진. All rights reserved.
//

import Foundation

struct TicketResponseString: Codable {
    let status: Int
    let message: String
    let results: TicketMovie
    
    enum CodingKeys: String, CodingKey {
        case status, message
        case results = "data"
    }
    
    
    struct TicketMovie: Codable {
        let movieReleaseStatus: Int
        let movieData: [movieTicketInfo]
        
    struct movieTicketInfo: Codable {
            let id: Int
            let thumnailImageURL: String
            let title: String
            let userRating: Float
            
            enum CodingKeys: String, CodingKey {
                case id = "movieIdx"
                case thumnailImageURL = "movieImg"
                case title = "movieName"
                case userRating = "movieScore"
            }
        }
    }
}
