//
//  YogaKitViewController.swift
//  ZDOpenSourceSwiftDemo
//
//  Created by Zero.D.Saber on 2017/8/9.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//

import UIKit
import YogaKit

class YogaKitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup() {
        yoga()
    }
    
    func yoga() -> Swift.Void {
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
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
