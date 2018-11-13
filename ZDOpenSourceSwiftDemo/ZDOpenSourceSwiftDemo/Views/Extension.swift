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

private var closureKey: Void?
extension UIWindow {
    open func swizzleShake() {
        let selector = #selector(motionBegan(_:with:))
        
        RSSwizzle.swizzleInstanceMethod(selector, in: UIWindow.self, newImpFactory: { (swizzleInfo: RSSwizzleInfo?) -> Any? in
            let clouse = { (target: UIWindow, motion: UIEvent.EventSubtype, event: UIEvent) -> Void in
                print("swizzle motionBegin")
                
                target.zd_motionBegin(motion, event: event)
                
                guard let originIMP = swizzleInfo?.getOriginalImplementation() else { return }
                /**
                 https://stackoverflow.com/questions/24586293/cast-closures-blocks
                 http://www.jianshu.com/p/f4dd6397ae86
                 */
                typealias Imp = @convention(c) (UIWindow, Selector, UIEvent.EventSubtype, UIEvent) -> Void
                let orginIMPBlock = unsafeBitCast(originIMP, to: Imp.self)
                orginIMPBlock(target, selector, motion, event)
            };
            
            typealias oc_block = @convention(block) (UIWindow, UIEvent.EventSubtype, UIEvent) -> ()
            let result_block = unsafeBitCast(clouse, to: oc_block.self)
            return result_block
            
        }, mode: .oncePerClassAndSuperclasses, key: &closureKey)
    }
    
    private func zd_motionBegin(_ motion: UIEvent.EventSubtype, event: UIEvent) {
        FLEXManager.shared().showExplorer()
    }
}
