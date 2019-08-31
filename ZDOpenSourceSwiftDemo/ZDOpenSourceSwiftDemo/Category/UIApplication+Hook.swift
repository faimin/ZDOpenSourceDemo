//
//  UIApplication+Hook.swift
//  ZDOpenSourceSwiftDemo
//
//  Created by Zero.D.Saber on 2019/9/1.
//  Copyright © 2019 Zero.D.Saber. All rights reserved.
//

import Foundation
import UIKit

// http://jordansmith.io/handling-the-deprecation-of-initialize/
// https://blog.yaoli.site/swift4_method_swizzlling.html
protocol SelfAware: class {
    static func awake()
}

class NothingToSeeHere {
    static func harmlessFunction() {
        let typeCount = Int(objc_getClassList(nil, 0))
        let types = UnsafeMutablePointer<AnyClass?>.allocate(capacity: typeCount)
        let autoreleasingTypes = AutoreleasingUnsafeMutablePointer<AnyClass>(types)
        objc_getClassList(autoreleasingTypes, Int32(typeCount))
        for index in 0 ..< typeCount {
            (types[index] as? SelfAware.Type)?.awake()
        }
        types.deallocate()
    }
}

extension UIApplication {
    
    private static let runOnce: Void = {
        NothingToSeeHere.harmlessFunction()
    }()
    
    override open var next: UIResponder? {
        // Called before applicationDidFinishLaunching
        UIApplication.runOnce
        return super.next
    }
}
