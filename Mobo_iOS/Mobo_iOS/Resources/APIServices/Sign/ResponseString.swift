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
    let success: Bool
    let message: String
    let data: DataClass?
}
// MARK: - DataClass
struct DataClass: Codable {
    let userIdx: Int
    let id, password, name, phone: String
}
