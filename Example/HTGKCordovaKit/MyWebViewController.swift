//
//  MyWebViewController.swift
//  HTGKCordovaKit_Example
//
//  Created by yujinhai on 2019/5/8.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import WebKit
import Cordova

class MyWebViewController: CDVViewController {
    
    var injectionLocalJS: [[String: Any]]?

    public var wkWebView: WKWebView {
        get {
            return self.webView as! WKWebView
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.wkWebView.uiDelegate = self
        self.wkWebView.navigationDelegate = self
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
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        CDVUserAgentUtil.releaseLock(self.userAgentLockToken)
    }

}

extension MyWebViewController: WKUIDelegate {
    
    public func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
    }
    public func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
    }
    public func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
    }
    // 处理打开新的页面 target="_blank"
    public func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if let isMainFrame = navigationAction.targetFrame?.isMainFrame,
            isMainFrame == true {
        } else {
            
            wkWebView.load(navigationAction.request)
        }
        return nil
    }
    
}
extension MyWebViewController: WKNavigationDelegate {
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.injectionJS()
        CDVUserAgentUtil.releaseLock(self.userAgentLockToken)
    }
}
extension MyWebViewController {
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
