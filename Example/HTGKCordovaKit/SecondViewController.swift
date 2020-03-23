//
//  SecondViewController.swift
//  HTGKCordovaKit_Example
//
//  Created by yujinhai on 2020/3/23.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import HTGKCordovaKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let myWebVC = MyWebViewController.init()
        myWebVC.startPage = "https://www.baidu.com"
        self.addChild(myWebVC)
        self.view.addSubview(myWebVC.view)
    }

}
