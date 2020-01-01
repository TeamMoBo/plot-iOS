//
//  ResponseString.swift
//  Mobo_iOS
//
//  Created by 천유정 on 24/12/2019.
//  Copyright © 2019 조경진. All rights reserved.
//

import Foundation

// MARK: - ResponseString // 성공했을 때 response body
struct ResponseString: Codable {
    let status: Int
    let message: String
    let data: DataClass?
    
    enum CodinKeys: String, CodingKey {
        case status
        case message
        case data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(String.self, forKey: .status)) ?? ""
        message = (try? values.decode(String.self, fotKey: .message)) ?? ""
        data = (try? values.decode(String.self, forKey: .data))
    }
}
// MARK: - DataClass
struct DataClass: Codable {
    let token : String
}
