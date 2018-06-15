//
//  ZDMovieListController.swift
//  ZDOpenSourceSwiftDemo
//
//  Created by Zero.D.Saber on 2018/6/15.
//  Copyright © 2018年 Zero.D.Saber. All rights reserved.
//

import UIKit

class ZDMovieListController: UIViewController {
    
    var dataSource: [ZDMovieModel]?
    let viewModel = ZDMovieViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    private func setup() {
        setupUI()
        setupData()
    }
    
    private func setupUI() {
        view.backgroundColor = .gray
    }
    
    private func setupData() -> Void {
        viewModel.fetchMovieList { [weak self] (list: [ZDMovieModel]?) in
            self?.dataSource = list
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
