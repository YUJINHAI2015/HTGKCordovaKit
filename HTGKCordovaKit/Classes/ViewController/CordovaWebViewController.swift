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

    public weak var delegate: CordovaWebViewControllerDelegate?
    
    public var wkWebView: WKWebView {
        get {
            return self.webView as! WKWebView
        }
    }
    override open func viewDidLoad() {
        super.viewDidLoad()

        self.wkWebView.navigationDelegate = self
    }
}
// MARK: - private
extension CordovaWebViewController {
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
}
/// MARK: - webView加载流程
extension CordovaWebViewController: WKNavigationDelegate {
    /// 加载开始
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.delegate?.cordovaWebView(webView, didStartProvisionalNavigation: navigation)
    }
    /// 加载完成
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.injectionJS()
        self.delegate?.cordovaWebView(webView, didFinish: navigation)
    }
    /// 加载失败
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.delegate?.cordovaWebView(webView, didFail: navigation, withError: error)
    }
}
///// MARK: - 拦截注册事件 -
//extension CordovaWebViewController: WKScriptMessageHandler {
//    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
//    }
//}

///// MARK: - WKUIDelegate 拦截提示框 -- CDVWKWebViewUIDelegate 已经实现
//extension CordovaWebViewController: WKUIDelegate {
//
//    public func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
//        // TODO: -
//        completionHandler("")
//    }
//    public func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
//        // TODO: -
//        completionHandler()
//    }
//    public func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
//        // TODO: -
//        completionHandler(true)
//    }
//}
// MARK: - util
extension CordovaWebViewController {
    
    func loadDataFromBundle(name: String) -> Data? {
        
        guard let path = Bundle.main.path(forResource: name, ofType: "") else {
            return nil
        }
        let url = URL.init(fileURLWithPath: path)
        
        let data = try? Data.init(contentsOf: url)
        
        return data
    }
}
