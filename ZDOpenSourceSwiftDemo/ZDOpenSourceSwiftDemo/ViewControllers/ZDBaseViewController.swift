//
//  ZDBaseViewController.swift
//  ZDOpenSourceSwiftDemo
//
//  Created by Zero.D.Saber on 2019/4/2.
//  Copyright © 2019 Zero.D.Saber. All rights reserved.
//

import UIKit

class ZDBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 状态存储key
        self.restorationIdentifier = NSStringFromClass(type(of: self))
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
