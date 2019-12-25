//
//  MyWebViewController.swift
//  HTGKCordovaKit_Example
//
//  Created by yujinhai on 2019/5/8.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import HTGKCordovaKit
import WebKit

class MyWebViewController: CordovaWebViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
    }
}

extension MyWebViewController: CordovaWebViewControllerDelegate {
    func cordovaWebView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        
    }
    
    func cordovaWebView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        
    }
    
    func cordovaWebView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        
    }
    
    func cordovaWebView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func cordovaWebView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    
    }
    
    func cordovaWebView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.title") { (value, error) in
            self.title = value as? String ?? ""
        }
    }
    
    func cordovaWebView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
}
