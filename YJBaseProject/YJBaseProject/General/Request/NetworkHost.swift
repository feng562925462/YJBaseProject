//
//  NetworkHost.swift
//  YJBaseProject
//
//  Created by 冯垚杰 on 2017/10/20.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import Foundation

public enum ServerHostType : String{
    case posted1 = "http://qxb.lmschina.net"  // 发布地址 (默认)
    case posted2 = "https://qxb.qixuer.com"  // 发布地址
    case test    = "http://wxb.qixuer.com/lms" // 测试地址
    case long    = "http://192.168.1.170:8181/" // 龙哥本地
    case parameterTest   = "http://httpbin.org/post"  // 接口测试
}

class NetworkHost: NSObject {
    class func baseURLStr() -> String {
        return ServerHostType.test.rawValue
    }
}


