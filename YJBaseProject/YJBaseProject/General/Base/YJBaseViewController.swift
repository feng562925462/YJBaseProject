//
//  YJBaseViewController.swift
//  YJBaseProject
//
//  Created by 冯垚杰 on 2017/10/16.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import UIKit

class YJBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }
    
    override  open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    deinit {
        printLog("\(classForCoder) deinit");
    }
}
