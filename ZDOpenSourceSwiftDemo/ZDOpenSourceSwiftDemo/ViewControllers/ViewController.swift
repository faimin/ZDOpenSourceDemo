//
//  ViewController.swift
//  ZDOpenSourceSwiftDemo
//
//  Created by Zero.D.Saber on 2017/8/4.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//

import UIKit
import ObjectiveC.runtime

class ViewController: ZDBaseViewController {
    var dataSource: [AnyClass] = []
    
    let ZDReuseCellIndentifier = "ReuseCell"
    // 每当这个类的新实例被创建时,这个闭包就会被调用,而闭包的返回值就会当做默认值赋值给这个属性
    // 添加lazy属性的话就相当于懒加载了,而且必须声明属性是变量;另外我们需要显示的指定属性的类型,并使用一个可以对这个属性进行赋值的语句来再首次访问时运行;
    // 因为实例在没有值的情况下以某种方式被初始化,然后在被访问时改变自己的值,所以要求该属性是可变的;
    // let 被声明在全局作用域下 或者 被声明为一个类型属性(声明为static let,而非声明为实例属性)的常量是自动具有惰性的(还是线程安全的)
    lazy private var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: UITableView.Style.plain)
        view.register(UITableViewCell.self, forCellReuseIdentifier: "ReuseCell")
        view.separatorInset = .zero
        return view
    }()
    
    // 以下写法 <=> Objective-C中的GNU-C写法
    let button1: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.addTarget(nil, action: #selector(ViewController.click), for: .touchUpInside)
        return button
    }()
    
    lazy var button2: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.addTarget(self, action: #selector(ViewController.click), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }

    private func setup() {
        setupUI()
        setupData()
    }
    
    private func setupUI() {
        view.backgroundColor = .cyan
        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        // add constraint
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let viewDict = ["tableView": tableView]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: viewDict))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tableView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: viewDict))
    }
    
    private func setupData() {
        let aClasses: [UIViewController.Type] = [YogaKitViewController.self, ZDFeedController.self, ZDMovieListController.self]
        
        for _ in 0...50 {
            let num: UInt32 = arc4random_uniform(UInt32(aClasses.count))
            dataSource.append(aClasses[Int(num)])
        }
        tableView.reloadData()
    }
    
    @objc func click() {}
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ZDReuseCellIndentifier)
        cell?.selectionStyle = .none
        cell?.layoutMargins = .zero
        return cell ?? UITableViewCell(style: .default, reuseIdentifier: NSStringFromClass(UITableViewCell.self))
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.text = "\(self.dataSource[indexPath.row])"
        cell.detailTextLabel?.text = "第\(indexPath.row + 1)行"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { // 出了当前作用域后执行,相当于RAC中的onExit宏
            tableView.deselectRow(at: indexPath, animated: true)
        }

        let aClass: UIViewController.Type = dataSource[indexPath.row] as! UIViewController.Type
        print("\(aClass.self)")
        navigationController?.show(aClass.init(), sender: nil)
    }
}

















