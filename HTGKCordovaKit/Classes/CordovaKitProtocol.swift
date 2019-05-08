//
//  CordovaKitProtocol.swift
//  CordovaTestDemo
//
//  Created by yujinhai on 2019/5/8.
//  Copyright © 2019 Forever High Tech Ltd. All rights reserved.
//

import UIKit
import WebKit

public protocol CordovaKitProtocol where Self: UIView {
    func fh_reload()
    func fh_isLoading() -> Bool
    func fh_stopLoading()
    func fh_canGoBack() -> Bool
    func fh_goBack()
    func fh_currentUrl() -> URL?
    func fh_currentUrlStr() -> String?
}

public extension CordovaKitProtocol {
    func fh_reload(){}
    func fh_isLoading() -> Bool { return false }
    func fh_stopLoading(){}
    func fh_canGoBack() -> Bool { return false }
    func fh_goBack(){}
    func fh_currentUrl() -> URL? { return nil }
    func fh_currentUrlStr() -> String? { return nil }
}

extension WKWebView: CordovaKitProtocol {
    
    public func fh_reload() {
        self.reload()
    }
    public func fh_isLoading() -> Bool {
        return self.isLoading
    }
    public func fh_stopLoading(){
        self.stopLoading()
    }
    public func fh_canGoBack() -> Bool {
        return self.canGoBack
    }
    public func fh_goBack(){
        self.goBack()
    }
    public func fh_currentUrl() -> URL? {
        return self.url
    }
    public func fh_currentUrlStr() -> String? {
        return self.url?.absoluteString
    }

}
