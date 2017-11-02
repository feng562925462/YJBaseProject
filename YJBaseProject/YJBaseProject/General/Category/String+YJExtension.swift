//
//  String+YJExtension.swift
//  YJBaseProject
//
//  Created by 冯垚杰 on 2017/10/17.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import Foundation
import UIKit


// MARK:- html转化为属性字符串
extension String {
    /// html转化为属性字符串
    func yj_toAttributedString() -> NSAttributedString? {
        
        guard let htmlData = self.data(using: String.Encoding.utf8) else { return nil }
        
        let importParams = [NSAttributedString.DocumentReadingOptionKey.documentType:NSAttributedString.DocumentType.html,
                            NSAttributedString.DocumentReadingOptionKey.characterEncoding:String.Encoding.utf8] as [NSAttributedString.DocumentReadingOptionKey : Any]
        
        if let attributed = try? NSAttributedString(data: htmlData, options: importParams, documentAttributes:nil) {
            return attributed
        } else{
           return nil
        }
    }
}

// MARK:- 计算字符串的宽高
extension String {
    /// 计算字符串的高度
    ///
    /// - Parameters:
    ///   - attribute: 字符串属性
    ///   - fixedWidth: 字符串显示的宽度
    /// - Returns: 返回的高度值
    func heightWithStringAttribute(attribute:[NSAttributedStringKey:AnyObject],fixedWidth:CGFloat) -> CGFloat {
        guard self.characters.count > 0 && fixedWidth > 0 else {
            return 0
        }
        
        let size = CGSize.init(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude)
        let text = self as NSString
        let rect = text.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attribute, context: nil)
        return rect.size.height+5
    }
    
    /// 计算字符串宽度
    ///
    /// - Parameters:
    ///   - attribute: 字符串属性
    ///   - fixedHeight: 字符串显示高度
    /// - Returns: 返回的宽度值
    func widthWithStringAttribute(attribute:[NSAttributedStringKey:AnyObject],fixedHeight:CGFloat) -> CGFloat {
        guard self.characters.count > 0 && fixedHeight > 0 else {
            return 0
        }
        
        let size = CGSize.init(width: CGFloat.greatestFiniteMagnitude, height:fixedHeight)
        let text = self as NSString
        let rect = text.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attribute, context: nil)
        return rect.size.width+5
    }
}
