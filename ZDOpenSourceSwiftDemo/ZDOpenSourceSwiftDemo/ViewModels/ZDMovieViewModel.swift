//
//  ZDMovieViewModel.swift
//  ZDOpenSourceSwiftDemo
//
//  Created by Zero.D.Saber on 2018/6/14.
//  Copyright © 2018年 Zero.D.Saber. All rights reserved.
//

import Foundation

class ZDMovieViewModel {
    // 没有自定义初始化的类，其属性需要设置为option
    var dataTask: URLSessionDataTask?
    
    func fetchMovieList(completaion: @escaping ([ZDMovieModel]?) -> Void) {
        dataTask = URLSession.shared.dataTask(with: URL(string: ZDAPI.ShowingMovies.rawValue)!, completionHandler: { (data, response, error) in
            guard let data = data else {
                completaion(nil)
                return
            }
            
            let jsonDecoder = JSONDecoder();
            var wrapModel: ZDMovieWrapModel?
            do {
                wrapModel = try jsonDecoder.decode(ZDMovieWrapModel.self, from: data)
            } catch let error as NSError {
                print("Error ---> : \(error.localizedDescription)")
            }
            guard let dataSource = wrapModel?.ms else {
                completaion(nil)
                return
            }
            completaion(dataSource)
        })
        dataTask?.resume()
    }
}
