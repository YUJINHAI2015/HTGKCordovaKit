//
//  ViewController.swift
//  HTGKCordovaKit
//
//  Created by YUJINHAI2015 on 05/07/2019.
//  Copyright (c) 2019 YUJINHAI2015. All rights reserved.
//

import UIKit
import HTGKCordovaKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    
    @IBAction func loadWebViewAction(_ sender: UIButton) {
        let configure = CordovaConfiguration.init(startPage: "http://masonzone.gitee.io/app-h5/#/mall")

        let myWebVC = MyWebViewController.init(configuration: configure)
        self.navigationController?.pushViewController(myWebVC, animated: true)
    }
    
}

