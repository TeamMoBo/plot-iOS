//
//  TicketMovie.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2020/01/02.
//  Copyright © 2020 조경진. All rights reserved.
//




//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        status = (try? values.decode(Int.self, forKey: .status)) ?? 0
//        message = (try? values.decode(String.self, forKey: .message)) ?? ""
//        data = (try? values.decode(String.self, forKey: .data))
//    }


}

// MARK: - DataClass
struct DataClass: Codable {
    let token : String
}


struct TicketMovie: Codable {
    let movieReleaseStatus: Int
    let movieData: [movieTicketInfo]

}

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

