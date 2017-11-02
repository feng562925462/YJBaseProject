//
//  UILabel+YJExtension.swift
//  YJBaseProject
//
//  Created by 冯垚杰 on 2017/10/25.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import UIKit
import Foundation

// MARK:- 改变行间距和字间距
extension UILabel {
    
    /// 改变行间距
    func yj_change(lineSpace:CGFloat) {
        UILabel.yj_changeSpace(label: self, lineSpace: lineSpace, wordSpace: 0)
    }
    
    /// 改变字间距
    func yj_change(wordSpace:CGFloat) {
        UILabel.yj_changeSpace(label: self, lineSpace: 0, wordSpace: wordSpace)
    }
    
    /// 改变行间距和字间距
    ///
    /// - Parameters:
    ///   - label: 视图
    ///   - lineSpace: 行间距
    ///   - wordSpace: 字间距
    class func yj_changeSpace(label:UILabel, lineSpace:CGFloat, wordSpace:CGFloat) {
        guard let labelText = label.attributedText else {
            printLog("\(label)无内容")
            return;
        }
        
        let attributedString = NSMutableAttributedString(attributedString: labelText)
        
        attributedString.addAttribute(NSAttributedStringKey.kern, value: wordSpace, range: NSMakeRange(0, labelText.length))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpace
        
        attributedString .addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, labelText.length))
        
        label.attributedText = attributedString
    }
}

// MARK:- 样式修改
extension UILabel {
    /// 更改部分内容颜色或者字体颜色
    func yj_change(yj_range:NSRange, yj_textColor:UIColor?, yj_font:UIFont?) {
        guard let yj_text = self.attributedText else {
            printLog("\(self)无内容")
            return;
        }
        
        let attritu = NSMutableAttributedString(attributedString: yj_text)
        
        if yj_textColor != nil {
            attritu.addAttribute(NSAttributedStringKey.foregroundColor, value: yj_textColor!, range: yj_range)
        }
        
        if yj_font != nil {
            attritu.addAttribute(NSAttributedStringKey.font, value: yj_font!, range: yj_range)
        }
        
        self.attributedText = attritu
    }
    
    /// 添加删除线
    func yj_addDeleteLine() {
        guard let yj_text = self.attributedText else {
            printLog("\(self)无内容")
            return;
        }
        let attritu = NSMutableAttributedString(attributedString: yj_text)
        attritu.addAttributes([NSAttributedStringKey.strikethroughStyle : NSUnderlineStyle.styleThick,
                               NSAttributedStringKey.foregroundColor : UIColor(hex: "999999") ?? UIColor.yj_random,
                               NSAttributedStringKey.baselineOffset : 0,
                               NSAttributedStringKey.font : self.font
                               ], range: NSMakeRange(0, yj_text.length))
        self.attributedText = attritu
    }
}


