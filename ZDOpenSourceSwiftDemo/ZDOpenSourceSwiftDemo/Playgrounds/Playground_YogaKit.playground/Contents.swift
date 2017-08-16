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
    layout.flexDirection = .row // default is column
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

// create button
let tabbarView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
tabbarView.backgroundColor = UIColor.cyan
tabbarView.configureLayout { (layout) in
    layout.isEnabled = true
    layout.flexDirection = .row
}

let barItem1 = createBarItem()
let barItem2 = createBarItem()
tabbarView.addSubview(barItem1)
tabbarView.addSubview(barItem2)

tabbarView.yoga.applyLayout(preservingOrigin: false)
tabbarView

func createBarItem() -> UIView {
    let barItem = UIView() //UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 50))
    barItem.backgroundColor = UIColor.yellow
    barItem.configureLayout { (layout) in
        layout.isEnabled = true
        layout.width = 100
        layout.height = 180
        layout.padding = 10
        
        layout.flexGrow = 1
        layout.marginRight = 20
    }
    
    let imageView = UIImageView()
    imageView.backgroundColor = .red
    imageView.configureLayout { (layout) in
        layout.isEnabled = true
        layout.flexGrow = 1
        layout.marginBottom = 10
    }
    barItem.addSubview(imageView)
    
    let label = UILabel()
    label.backgroundColor = .red
    label.configureLayout { (layout) in
        label.isEnabled = true
        layout.flexGrow = 1
    }
    barItem.addSubview(label)
    
    return barItem
}












 
