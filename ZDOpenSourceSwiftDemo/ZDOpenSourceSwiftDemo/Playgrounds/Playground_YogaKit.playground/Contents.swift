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

// Create custom button
func createBarItem() -> UIControl {
    let barItem = UIControl()
    barItem.backgroundColor = UIColor.yellow
    barItem.configureLayout { (layout) in
        layout.isEnabled = true
        layout.width = 100
        layout.height = 200
        layout.padding = 10
        
        layout.flexGrow = 1
    }
    
    let imageView = UIImageView()
    imageView.backgroundColor = .green
    imageView.contentMode = .scaleToFill
    imageView.image = #imageLiteral(resourceName: "hami.gif")
    imageView.configureLayout { (layout) in
        layout.isEnabled = true
        layout.flexGrow = 2
        layout.aspectRatio = 1.0/1.2   // width / height
        layout.marginBottom = 10
    }
    barItem.addSubview(imageView)
    
    let label = UILabel()
    label.backgroundColor = .red
    label.text = "阿尔托莉雅·潘德拉贡" // button title
    label.textAlignment = .center
    label.textColor = .blue
    label.numberOfLines = 0
    label.configureLayout { (layout) in
        label.isEnabled = true
        layout.flexGrow = 1
    }
    barItem.addSubview(label)
    
    return barItem
}


let tabbarView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
tabbarView.backgroundColor = UIColor.cyan
tabbarView.configureLayout { (layout) in
    layout.isEnabled = true
    layout.flexDirection = .row
    layout.paddingHorizontal = 10
    layout.paddingTop = 10
}

let barItem1 = createBarItem()
let barItem2 = createBarItem()
barItem1.yoga.marginRight = 10
barItem2.yoga.marginLeft = 10   // 这样一来,1和2之间的间距变为了20
tabbarView.addSubview(barItem1)
tabbarView.addSubview(barItem2)

tabbarView.yoga.applyLayout(preservingOrigin: false)
tabbarView














 
