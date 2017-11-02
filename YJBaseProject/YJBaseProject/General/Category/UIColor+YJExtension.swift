//
//  UIColor+YJExtension.swift
//  YJBaseProject
//
//  Created by 冯垚杰 on 2017/10/25.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    // MARK:- 随机颜色
    /// 随机颜色q
    open class var yj_random: UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
    
    // MARK:- 当前颜色的rgb值
    /// 当前颜色的rgb值
    open var yj_rgb: (CGFloat,CGFloat,CGFloat) {
        guard let cmps = self.cgColor.components else {
            fatalError("设置的颜色必须是RGB颜色")
        }
        return (cmps[0]*255,cmps[1]*255,cmps[2]*255)
    }

    // MARK:- 通过rgb创建颜色
    /// 创建类方法一般都会创建·便利的构造函数来代替类方法·
    convenience init(r:CGFloat,g : CGFloat, b : CGFloat ,alpha:CGFloat=1.0) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }
    
    // MARK:- 16进制颜色
    /// 16进制颜色
    convenience init?(hex:String,alpha:CGFloat=1.0) {
        // 1.判断出来的字符串长度是否大于6
        guard hex.characters.count >= 6 else {
            return nil
        }
        // 2.将字符串转换成大写
        var  temHex = hex.uppercased()
        
        // 3.判断字符串是否以`0X`或者`##`开头
        if temHex.hasPrefix("0x") || temHex.hasPrefix("##") {
            temHex = (temHex as NSString).substring(from: 2)
        }
        // 3.1判断字符串是否以`#`开头
        if temHex.hasPrefix("#") {
            temHex = (temHex as NSString).substring(from: 1)
        }
        // 截取r g  b 对应的字符串
        var rang = NSRange.init(location: 0, length: 2)
        let rHex = (temHex as NSString).substring(with: rang)
        rang.location  = 2
        let gHex = (temHex as NSString).substring(with: rang)
        rang.location = 4
        let bHex = (temHex as NSString).substring(with: rang)
        // 4。将16进制转换为数字
        var r:UInt32 = 0 , g:UInt32 = 0, b:UInt32 = 0
        Scanner.init(string: rHex).scanHexInt32(&r)
        Scanner.init(string: gHex).scanHexInt32(&g)
        Scanner.init(string: bHex).scanHexInt32(&b)
        self.init(r:CGFloat(r),g : CGFloat(g), b : CGFloat(b) ,alpha:alpha)
    }
    
    // MARK:- 得到rgb颜色差 返回的是一个元组
    /// 得到rgb颜色差 返回的是一个元组
    class func yj_colorDifference(_ firstColor:UIColor,_ seccondColor:UIColor)->(CGFloat,CGFloat,CGFloat)
    {
        let first = firstColor.yj_rgb
        let seccond  = seccondColor.yj_rgb
        return (first.0-seccond.0,first.1-seccond.1,first.2-seccond.2)
    }
    
    // MARK:- 得到两个颜色是否相等
    /// 得到两个颜色是否相等
    func yj_equalTo(_ color: UIColor) -> Bool {
        return self.cgColor.__equalTo(color.cgColor)
    }
}
