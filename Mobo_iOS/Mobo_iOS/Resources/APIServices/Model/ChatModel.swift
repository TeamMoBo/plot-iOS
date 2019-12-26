//
//  ChatModel.swift
//  Mobo_iOS
//
//  Created by 조경진 on 2019/12/24.
//  Copyright © 2019 조경진. All rights reserved.
//

import UIKit
import ObjectMapper

class ChatModel: Mappable {
    

    
    public var users :Dictionary<String,Bool> = [:] //채팅방에 참여한 사람들
    public var comments :Dictionary<String,Comment> = [:] //채팅방의 대화내용
    required init?(map: Map) {
        
    }
     func mapping(map: Map) {
        users <- map["users"]
        comments <- map["comments"]
    }
    public class Comment :Mappable{
        public var uid : String?
        public var message : String?
        public required init?(map: Map) {
            
        }
        public  func mapping(map: Map) {
            uid <- map["uid"]
            message <- map["message"]
        }
    }
    
}
