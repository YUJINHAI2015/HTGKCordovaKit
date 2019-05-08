//
//  ViewController.swift
//  HTGKCordovaKit
//
//  Created by YUJINHAI2015 on 05/07/2019.
//  Copyright (c) 2019 YUJINHAI2015. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    
    @IBAction func loadWebViewAction(_ sender: UIButton) {
        let myWebVC = MyWebViewController.init(configuration: nil)
        self.navigationController?.pushViewController(myWebVC, animated: true)
    }
    
}

