//
//  YogaKitViewController.swift
//  ZDOpenSourceSwiftDemo
//
//  Created by Zero.D.Saber on 2017/8/9.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//
//  Yoga 教程: 使用跨平台布局引擎:https://archimboldi.me/posts/%E7%BF%BB%E8%AF%91-yoga-%E6%95%99%E7%A8%8B-%E4%BD%BF%E7%94%A8%E8%B7%A8%E5%B9%B3%E5%8F%B0%E5%B8%83%E5%B1%80%E5%BC%95%E6%93%8E.html

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
        setupUI()
        yoga()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor.cyan
        self.automaticallyAdjustsScrollViewInsets = false
        self.extendedLayoutIncludesOpaqueBars = false
    }
    
    func yoga() -> Swift.Void {
        
        view.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexDirection = .row         // 主轴上横向布局
            layout.justifyContent = .center     // 主轴方向上元素的对齐方式
            layout.alignItems = .center         // 对轴方向上元素的对齐方式
            layout.padding = 10                 // 四周内边距为10
        }
        
        let contentView = UIView()
        contentView.backgroundColor = UIColor.green
        contentView.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexDirection = .column
            layout.justifyContent = .center
            layout.alignItems = .flexStart
            layout.paddingHorizontal = 10
            layout.marginVertical = 100         // 外边距100
            layout.flexGrow = 0.7               // 在父视图的flexDirection方向上占父视图宽高的百分比,默认值为0
        }
        
        let subContent = UIView()
        subContent.backgroundColor = .red
        subContent.configureLayout { (layout) in
            layout.isEnabled = true
            layout.flexDirection = .row
            layout.justifyContent = .center
            layout.alignItems = .stretch
            layout.marginBottom = 30
            layout.marginRight = 20
            layout.flexGrow = 1
        }
        
        let child1 = UIView()
        child1.backgroundColor = .yellow
        child1.configureLayout { (layout) in
            layout.isEnabled = true
            layout.margin = 20
            layout.flexGrow = 1
        }
        
        subContent.addSubview(child1)
        contentView.addSubview(subContent)
        view.addSubview(contentView)
        view.yoga.applyLayout(preservingOrigin: false)
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
