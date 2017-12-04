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
            return { (target: UIWindow, motion: UIEventSubtype, event: UIEvent) -> Void in
                print("swizzle motionBegin")
                
                target.zd_motionBegin(motion, event: event)
                
                guard let originIMP = swizzleInfo?.getOriginalImplementation() else {return}
                // http://www.jianshu.com/p/f4dd6397ae86
                typealias Imp = @convention(c) (UIWindow, Selector, UIEventSubtype, UIEvent) -> Void
                let orginIMPBlock = unsafeBitCast(originIMP, to: Imp.self)
                orginIMPBlock(target, selector, motion, event)
                
            };
        }, mode: .oncePerClassAndSuperclasses, key: &key)
    }
    
    private func zd_motionBegin(_ motion: UIEventSubtype, event: UIEvent) {
        FLEXManager.shared().showExplorer()
    }
}
