//
//  APIServices.swift
//  Mobo_iOS
//
//  Created by 천유정 on 01/01/2020.
//  Copyright © 2020 조경진. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
