//
//  CordovaConfiguration.swift
//  CordovaTestDemo
//
//  Created by yujinhai on 2019/5/8.
//  Copyright © 2019 Forever High Tech Ltd. All rights reserved.
//

import UIKit

public class CordovaConfiguration: NSObject {
    /// 要加载的文件路径，默认是www
    public var wwwFolderName: String?
    /// www目录下的文件，默认已经加载到www文件。也可以直接加载http开头
    public var startPage: String?
    /// 设置userAgent
    public var baseUserAgent: String?
    /// 加载本地沙盒文件路径
    public var localPath: String?
    
    public convenience init(wwwFolderName: String? = nil,
                            startPage: String? = nil,
                            baseUserAgent: String? = nil,
                            localPath: String? = nil) {
        self.init()
        self.wwwFolderName = wwwFolderName
        self.startPage = startPage
        self.baseUserAgent = baseUserAgent
        self.localPath = localPath
    }
    public override init() {
        
    }

}

