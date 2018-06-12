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
    
    enum CodingKeys: String, CodingKey {
        case title
        case content
        case userName = "username"
        case timeString = "time"
        case localImageName = "imageName"
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
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(content, forKey: .content)
        try container.encode(username, forKey: .userName)
        try container.encode(timeString, forKey: .timeString)
        try container.encode(localImageName, forKey: .localImageName)
    }
}




