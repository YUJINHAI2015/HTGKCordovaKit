//
//  CordovaConfiguration.swift
//  CordovaTestDemo
//
//  Created by yujinhai on 2019/5/8.
//  Copyright © 2019 Forever High Tech Ltd. All rights reserved.
//

import UIKit

public struct CordovaConfiguration {
    /// 要加载的文件路径，默认是www
    var wwwFolderName: String?
    /// www目录下的文件，默认已经加载到www文件。也可以直接加载http开头
    var startPage: String?
    var baseUserAgent: String?
    /// 加载本地沙盒文件路径
    var localPath: String?

}

