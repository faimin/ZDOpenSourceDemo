//
//  ViewController.swift
//  ZDOpenSourceSwiftDemo
//
//  Created by Zero.D.Saber on 2017/8/4.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let ZDReuseCellIndentifier = "ReuseCell"
    private let tableView: UITableView = {
        let view = UITableView(frame: .zero, style: UITableViewStyle.plain)
        view.register(UITableViewCell.self, forCellReuseIdentifier: "ReuseCell")
        view.separatorInset = .zero
        return view
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
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
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

















