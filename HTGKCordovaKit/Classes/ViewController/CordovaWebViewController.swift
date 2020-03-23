//
//  CordovaWebViewController.swift
//  CordovaTestDemo
//
//  Created by yujinhai on 2019/5/8.
//  Copyright © 2019 Forever High Tech Ltd. All rights reserved.
//

import UIKit
import WebKit
import Cordova

open class CordovaWebViewController: CDVViewController {
    
    var injectionLocalJS: [[String: Any]]?

    public var wkWebView: WKWebView {
        get {
            return self.webView as! WKWebView
        }
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didFinish), name: NSNotification.Name.CDVPageDidLoad, object: nil)
    }
    
    @objc func didFinish() {
        self.injectionJS()
    }

    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience public init(injectionLocalJS: [[String: Any]]? = [["applocal://": "cordova.js"]]) {
        self.init(nibName: nil, bundle: nil)
        
        self.injectionLocalJS = injectionLocalJS
    }

}
// MARK: - private
extension CordovaWebViewController {
    // 注入js
    func injectionJS(){
        self.wkWebView.evaluateJavaScript("document.getElementsByTagName('html')[0].innerHTML") { (value, error) in
            
            self.injectionLocalJS?.forEach({ (dict) in
                
                guard let valueString = value as? String,
                    valueString.contains(dict.keys.first!) else { // 注意注入顺序，判断是applocal时才注入
                        return
                }
                
                if let data = self.loadDataFromBundle(name: (dict.values.first as? String) ?? "") {
                    let cordovaString = String.init(data: data, encoding: .utf8)
                    self.wkWebView.evaluateJavaScript(cordovaString ?? "", completionHandler: nil)
                }
            })
        }
    }
    
    func loadDataFromBundle(name: String) -> Data? {
        
        guard let path = Bundle.main.path(forResource: name, ofType: "") else {
            return nil
        }
        let url = URL.init(fileURLWithPath: path)
        
        let data = try? Data.init(contentsOf: url)
        
        return data
    }
    
}
