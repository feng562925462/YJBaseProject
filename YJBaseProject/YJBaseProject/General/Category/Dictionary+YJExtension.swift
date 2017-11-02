//
//  Dictionary+YJExtension.swift
//  YJBaseProject
//
//  Created by 冯垚杰 on 2017/10/26.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import Foundation

extension Dictionary {
    /// 字典转json
    ///
    /// - Returns: 转换之后的结果
    func yj_jsonString(_ isNeedNewline : Bool) -> String? {
        
        if (!JSONSerialization.isValidJSONObject(self)) {
            print("无法解析出JSONString")
            return nil
        }
        
        guard let data = try? JSONSerialization.data(withJSONObject: self, options: []) else {
            printLog("解析错误")
            return nil
        }
        
        var JSONString = String(data: data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        
        if isNeedNewline == true {
            JSONString = JSONString?.replacingOccurrences(of: " ", with: "")
            JSONString = JSONString?.replacingOccurrences(of: "\n", with: "")
        }
        return JSONString;
    }

}
