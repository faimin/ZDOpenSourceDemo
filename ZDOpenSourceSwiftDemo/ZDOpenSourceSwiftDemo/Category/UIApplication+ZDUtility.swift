//
//  UIApplication+ZDUtility.swift
//  ZDOpenSourceSwiftDemo
//
//  Created by Zero.D.Saber on 2019/1/14.
//  Copyright © 2019 Zero.D.Saber. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    // https://www.appcoda.com.tw/first-responder
    var zd_firstResponder: UIResponder? {
        var _firstResponder: UIResponder?
        
        let firstResponderCallback = { (responder: UIResponder?) -> Void in
            _firstResponder = responder;
        }
        sendAction(#selector(UIResponder.zd_reportAsFirstResponder), to: nil, from: firstResponderCallback, for: nil)
        
        return _firstResponder
    }
    
}

extension UIResponder {
    
    @objc fileprivate func zd_reportAsFirstResponder(sender: Any) {
        guard let callback = sender as? (UIResponder) -> Void else {
            return
        }
        callback(self)
    }
    
}
