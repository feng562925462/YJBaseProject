//
//  NetworkTestAPI.swift
//  YJBaseProject
//
//  Created by 冯垚杰 on 2017/10/27.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import Foundation

enum NetworkTestAPI {
    case test
    case test1(username:String?, password:String?)
}

extension NetworkTestAPI : NetworkBaseAPI {
    var parameters: [String : Any] {
        
        switch self {
        case .test1(let username,let password):
            
            var par : [String : Any] = [:]
            
            if username != nil {
                par["j_username"] = username!
            }
            
            if password != nil {
                par["j_password"] = password!
            }
            return par
        default:
            return [:]
        }
    }
    
    var path: String {
        return ""
    }
}
