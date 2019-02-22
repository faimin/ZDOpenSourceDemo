//
//  ZDExtension.swift
//  ZDOpenSourceSwiftDemo
//
//  Created by Zero.D.Saber on 2019/1/23.
//  Copyright © 2019 Zero.D.Saber. All rights reserved.
//

import Foundation

//MARK: - URL Extension
extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = URL(string: value)!
    }
}
//let url: URL = "www.google.com"

//MARK: - Optional Extension
//https://www.objc.io/blog/2019/01/22/non-empty-optionals/
extension Optional where Wrapped: Collection {
    var nonEmpty: Wrapped? {
        return self?.isEmpty == true ? nil : self
    }
}

extension Collection {
    var nonEmpty: Self? {
        return isEmpty ? nil : self
    }
}
