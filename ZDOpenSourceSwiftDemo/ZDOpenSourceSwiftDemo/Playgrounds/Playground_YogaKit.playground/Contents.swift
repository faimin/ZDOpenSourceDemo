//: Playground - noun: a place where people can play

import UIKit
import LayoutKit
import YogaKit

var str = "Hello, playground"


let contentView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
contentView.backgroundColor = UIColor.white
contentView.configureLayout { (layout) in
    layout.isEnabled = true
    layout.alignItems = .center
    layout.justifyContent = .center
}

let subContent = UIView()
subContent.backgroundColor = .red
subContent.configureLayout { (layout) in
    layout.isEnabled = true
    layout.flexDirection = .row
    layout.alignItems = .stretch
    layout.width = 180
    layout.height = 50
    layout.margin = 20
}

let child1 = UIView()
child1.backgroundColor = .yellow
child1.configureLayout { (layout) in
    layout.isEnabled = true
    layout.flexGrow = 1
    layout.margin = 6
    layout.padding = 5
    layout.borderWidth = 10
}

subContent.addSubview(child1)
contentView.addSubview(subContent)
contentView.yoga.applyLayout(preservingOrigin: false)
 

 
