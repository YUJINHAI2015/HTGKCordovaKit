//
//  CordovaBaseWebViewController.swift
//  CordovaTestDemo
//
//  Created by yujinhai on 2019/5/8.
//  Copyright © 2019 Forever High Tech Ltd. All rights reserved.
//

import UIKit
import Cordova

open class CordovaBaseWebViewController: CDVViewController {
    
    required public init(configuration: CordovaConfiguration?) {
        super.init(nibName: nil, bundle: nil)
        self.initConfigure(config: configuration)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -initial webview configure
    func initConfigure(config: CordovaConfiguration?){
        if let wwwFolderName = config?.wwwFolderName  {
            self.wwwFolderName = wwwFolderName
        }
        
        if let startPage = config?.startPage  {
            self.startPage = startPage
        }

        if let baseUserAgent = config?.baseUserAgent  {
            self.baseUserAgent = baseUserAgent
        }

        if let _ = config?.localPath {
            // TODO: -还未实现
        }
    }
    
}
