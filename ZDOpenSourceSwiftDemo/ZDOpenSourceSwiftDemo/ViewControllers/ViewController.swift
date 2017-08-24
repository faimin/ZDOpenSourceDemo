//
//  ViewController.swift
//  ZDOpenSourceSwiftDemo
//
//  Created by Zero.D.Saber on 2017/8/4.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let ZDReuseCellIndentifier = "ReuseCell"
    // 每当这个类的新实例被创建时,这个闭包就会被调用,而闭包的返回值就会当做默认值赋值给这个属性
    // 添加lazy属性的话就相当于懒加载了,而且必须为变量;
    // 因为实例在没有值的情况下以某种方式被初始化,然后在被访问时改变自己的值,所以要求该属性是可变的;
    // let 被声明在全局作用域下 或者 被声明为一个类型属性(声明为static let,而非声明为实例属性)的常量是自动具有惰性的(还是线程安全的)
    lazy private var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: UITableViewStyle.plain)
        view.register(UITableViewCell.self, forCellReuseIdentifier: "ReuseCell")
        view.separatorInset = .zero
        return view
    }()
    
    let button1: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.addTarget(nil, action: #selector(ViewController.click), for: .touchUpInside)
        return button
    }()
    
    lazy var button2: UIButton = {
        let button = UIButton(type: UIButtonType.custom)
        button.addTarget(self, action: #selector(ViewController.click), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setup() {
        setupUI()
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
    
    func click() {}
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
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
        cell.textLabel?.text = "第\(indexPath.row)行"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { // 出了当前作用域后执行,相当于RAC中的onExit宏
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

















