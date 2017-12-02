//
//  Extension.swift
//  ZDOpenSourceSwiftDemo
//
//  Created by Zero.D.Saber on 2017/12/2.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//

import Foundation
import UIKit
import RSSwizzle
import FLEX

extension UIWindow {
    open func swizzleShake() {
        let selector = #selector(motionBegan(_:with:))
        var key = "shake"
        
        RSSwizzle.swizzleInstanceMethod(selector, in: UIWindow.self, newImpFactory: { (swizzleInfo: RSSwizzleInfo?) -> Any? in
            return { (target: UIWindow, motion: UIEventSubtype, event: UIEvent) in
                print("swizzle motionBegin")
                
                target.zd_motionBegin(motion, event: event)
                
                guard let originIMP = swizzleInfo?.getOriginalImplementation() else {return}
                //originIMP(self, selector)
                print(originIMP)
            }
        }, mode: .oncePerClassAndSuperclasses, key: &key)
    }
    
    private func zd_motionBegin(_ motion: UIEventSubtype, event: UIEvent) {
        FLEXManager.shared().showExplorer()
    }
}
