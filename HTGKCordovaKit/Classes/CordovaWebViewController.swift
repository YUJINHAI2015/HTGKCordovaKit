//
//  CordovaWebViewController.swift
//  CordovaTestDemo
//
//  Created by yujinhai on 2019/5/8.
//  Copyright © 2019 Forever High Tech Ltd. All rights reserved.
//

import UIKit
import WebKit

open class CordovaWebViewController: CordovaBaseWebViewController {

    public var wkWebView: WKWebView {
        get {
            return self.webView as! WKWebView
        }
    }
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.wkWebView.uiDelegate = self
        self.wkWebView.navigationDelegate = self
    }
}
/// MARK: - webView加载流程
extension CordovaWebViewController: WKNavigationDelegate {
    /// 加载开始
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        // TODO: -
    }
    /// 加载完成
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // TODO: -
    }
    /// 加载失败
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        // TODO: -
    }
}
///// MARK: - 拦截注册事件 -- 暂时没有用到，因为没有注册事件。
//extension CordovaWebViewController: WKScriptMessageHandler {
//    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
//        // TODO: -
//    }
//
//
//}
//
/// MARK: - WKUIDelegate 拦截提示框 -- 暂时也没有用到
extension CordovaWebViewController: WKUIDelegate {

    public func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        // TODO: -
        completionHandler("")
    }
    public func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        // TODO: -
        completionHandler()
    }
    public func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        // TODO: -
        completionHandler(true)
    }
}

