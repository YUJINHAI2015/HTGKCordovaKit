//
//  CordovaWebViewControllerDelegate.swift
//  Cordova
//
//  Created by yujinhai on 2019/6/14.
//

import UIKit
import WebKit

public protocol CordovaWebViewControllerDelegate: NSObjectProtocol {

    func cordovaWebView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!)
    func cordovaWebView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
    func cordovaWebView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error)
    func cordovaWebView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void)
    func cordovaWebView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void)
    func cordovaWebView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void)
    func cordovaWebView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void)

}

extension CordovaWebViewControllerDelegate {
    func cordovaWebView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {}
    func cordovaWebView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {}
    func cordovaWebView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {}
    func cordovaWebView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void)
    {
        decisionHandler(.allow)
    }
    func cordovaWebView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void){
        completionHandler("")
    }
    func cordovaWebView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void){
        completionHandler()
    }
    func cordovaWebView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void){
        completionHandler(true)
    }

}
