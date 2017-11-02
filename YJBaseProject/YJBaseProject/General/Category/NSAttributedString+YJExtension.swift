//
//  NSAttributedString+YJExtension.swift
//  YJBaseProject
//
//  Created by 冯垚杰 on 2017/10/26.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import Foundation

// MARK:- 属性字符串转化为html
extension NSAttributedString {
    
    func yj_toHtml() -> String? {
        
        
        let exportParams = [NSAttributedString.DocumentAttributeKey.documentType:NSAttributedString.DocumentType.html,
                            NSAttributedString.DocumentAttributeKey.characterEncoding:String.Encoding.utf8] as [NSAttributedString.DocumentAttributeKey : Any]
        
        if let htmlData = try? self.data(from: NSMakeRange(0, self.length), documentAttributes: exportParams) {
            return String(data: htmlData, encoding: String.Encoding.utf8)
        } else {
            return nil
        }
    }
}
