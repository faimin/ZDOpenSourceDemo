//
//  ZDFeedViewModel.swift
//  ZDOpenSourceSwiftDemo
//
//  Created by Zero.D.Saber on 2018/6/12.
//  Copyright © 2018年 Zero.D.Saber. All rights reserved.
//

import Foundation

struct ZDFeedViewModel {
    
    func zd_decodeFeedData() -> Array<Feed?> {
        let jsonPath = Bundle.main.path(forResource: "data", ofType: "json")
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: jsonPath!))
        
        let decoder = JSONDecoder()
        let feeds = try? decoder.decode(ZDFeedModel.self, from: jsonData)

        return feeds?.feed ?? []
    }
}
