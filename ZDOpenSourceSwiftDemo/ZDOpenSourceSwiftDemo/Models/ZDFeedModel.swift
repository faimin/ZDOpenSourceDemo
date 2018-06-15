//
//  ZDFeedModel.swift
//  ZDOpenSourceSwiftDemo
//
//  Created by Zero.D.Saber on 2018/6/12.
//  Copyright © 2018年 Zero.D.Saber. All rights reserved.
//

import Foundation

struct ZDFeedModel: Codable {
    let feed: [Feed]
}

struct Feed: Codable {
    let title: String
    let content: String
    let username: String
    let timeString: String
    var localImageName: String = ""
    let body: Body?
    
    enum CodingKeys: String, CodingKey {
        case title
        case content
        case userName = "username"
        case timeString = "time"
        case localImageName = "imageName"
        case body
    }
    
    /*
    enum BodyKeys: String, CodingKey {
        case height
        case weight
    }
     */
}

struct Body: Codable {
    let weight: Int
    let height: Int
    
    enum BodyKeys: String, CodingKey {
        case height
        case weight
    }
}


extension Feed {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        content = try container.decode(String.self, forKey: .content)
        username = try container.decode(String.self, forKey: .userName)
        timeString = try container.decode(String.self, forKey: .timeString)
        localImageName = try container.decode(String.self, forKey: .localImageName)
        // 因为body有可能为空字段，所以用decodeIfPresent解档
        body = try container.decodeIfPresent(Body.self, forKey: .body)
        
        /*
        // 如果想把下一级中的数据解析到当前级，需要嵌套解析 nestedContainer(keyedBy:forKey)
        let bodyContainer = try container.nestedContainer(keyedBy: BodyKeys.self, forKey: .body)
        height = try bodyContainer.decode(Int.self, forKey: .height)
        weight = try bodyContainer.decode(Int.self, forKey: .weight)
        */
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(content, forKey: .content)
        try container.encode(username, forKey: .userName)
        try container.encode(timeString, forKey: .timeString)
        try container.encode(localImageName, forKey: .localImageName)
        // 因为body有可能为空字段，所以用encodeIfPresent归档
        //try container.encode(body, forKey: .body)
        try container.encodeIfPresent(body, forKey: .body)
    }
}

extension Body {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BodyKeys.self)
        weight = try container.decode(Int.self, forKey: .weight)
        height = try container.decode(Int.self, forKey: .height)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: BodyKeys.self)
        try container.encode(weight, forKey: .weight)
        try container.encode(height, forKey: .height)
    }
}




