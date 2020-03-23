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
        self.view.backgroundColor = .white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.myWebVC()
    }
    
    func myWebVC() {
        
        let myWebVC = MyWebViewController.init(injectionLocalJS: [["applocal://": "cordova.js"],["hello://": "hello.js"]])
        myWebVC.startPage = "https://www.baidu.com"
        self.navigationController?.pushViewController(myWebVC, animated: true)
        

    }
}
