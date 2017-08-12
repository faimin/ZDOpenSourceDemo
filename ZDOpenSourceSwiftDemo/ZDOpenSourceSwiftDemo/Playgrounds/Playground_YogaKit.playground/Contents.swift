//: Playground - noun: a place where people can play

import UIKit
import LayoutKit
import YogaKit

var str = "Hello, playground"

//: YogaKit
let contentView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
contentView.backgroundColor = .white
contentView.configureLayout { (layout) in
    layout.isEnabled = true
    layout.alignItems = .stretch
    layout.justifyContent = .center
}

let subContent = UIView()
subContent.backgroundColor = .red
subContent.configureLayout { (layout) in
    layout.isEnabled = true
    layout.flexDirection = .row
    layout.alignItems = .stretch
    layout.margin = 20
    layout.flexGrow = 1
}

let leaf = UIView()
leaf.backgroundColor = .yellow
leaf.configureLayout { (layout) in
    layout.isEnabled = true
    layout.flexGrow = 1
    layout.margin = 30
    //layout.borderWidth = 10
}

subContent.addSubview(leaf)
contentView.addSubview(subContent)
contentView.yoga.applyLayout(preservingOrigin: false)

subContent
contentView
 
