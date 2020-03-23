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
                
        self.wkWebView.uiDelegate = self
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
