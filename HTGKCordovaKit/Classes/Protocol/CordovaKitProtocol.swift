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
    func cd_reload()
    func cd_isLoading() -> Bool
    func cd_stopLoading()
    func cd_canGoBack() -> Bool
    func cd_goBack()
    func cd_currentUrl() -> URL?
    func cd_currentUrlStr() -> String?
}

public extension CordovaKitProtocol {
    func cd_reload(){}
    func cd_isLoading() -> Bool { return false }
    func cd_stopLoading(){}
    func cd_canGoBack() -> Bool { return false }
    func cd_goBack(){}
    func cd_currentUrl() -> URL? { return nil }
    func cd_currentUrlStr() -> String? { return nil }
}

extension WKWebView: CordovaKitProtocol {
    
    public func cd_reload() {
        self.reload()
    }
    public func cd_isLoading() -> Bool {
        return self.isLoading
    }
    public func cd_stopLoading(){
        self.stopLoading()
    }
    public func cd_canGoBack() -> Bool {
        return self.canGoBack
    }
    public func cd_goBack(){
        self.goBack()
    }
    public func cd_currentUrl() -> URL? {
        return self.url
    }
    public func cd_currentUrlStr() -> String? {
        return self.url?.absoluteString
    }

}
