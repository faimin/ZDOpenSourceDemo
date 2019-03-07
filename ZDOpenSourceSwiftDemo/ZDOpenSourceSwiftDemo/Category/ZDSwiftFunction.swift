//
//  ZDSwiftFunction.swift
//  ZDOpenSourceSwiftDemo
//
//  Created by Zero.D.Saber on 2019/3/7.
//  Copyright © 2019 Zero.D.Saber. All rights reserved.
//

import Foundation

// https://twitter.com/johnsundell/status/1055562781070684162
func combine<A, B>(_ value: A, with closure: @escaping (A) -> B) -> () -> B {
    return { closure(value) } // <==> { () in closure(value) }
}
