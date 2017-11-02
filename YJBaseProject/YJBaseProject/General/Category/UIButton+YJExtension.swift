//
//  UIButton+YJExtension.swift
//  YJBaseProject
//
//  Created by 冯垚杰 on 2017/10/26.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import Foundation
import UIKit


enum YJImagePosition {
    /// 图片在左，文字在右，默认
    case left
    /// 图片在右，文字在左
    case right
    /// 图片在上，文字在下
    case top
    /// 图片在下，文字在上
    case bottom
}

extension UIButton {
    /**
     *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
     *  注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
     *
     *  @param spacing 图片和文字的间隔
     */
    func yj_updateImagePosition(postion:YJImagePosition = .left, spacing:CGFloat = 0) {
        
        guard let imageWith = self.imageView?.image?.size.width else {
            return
        }
        
        guard let imageHeight = self.imageView?.image?.size.height else {
            return
        }
        
        guard let labelText = self.titleLabel?.text as NSString? else { return }
        
        let labelWidth = labelText.size(withAttributes: [NSAttributedStringKey.font : self.titleLabel?.font ?? UIFont.systemFontSize]).width
        let labelHeight = labelText.size(withAttributes: [NSAttributedStringKey.font : self.titleLabel?.font ?? UIFont.systemFontSize]).height
        
        // image中心移动的x
        let imageOffsetX = (imageWith + labelWidth) / 2 - imageWith / 2
        //image中心移动的y距离
        let imageOffsetY = imageHeight / 2 + spacing / 2.0
        
        //label中心移动的x距离
        let labelOffsetX = (imageWith + labelWidth / 2) - (imageWith + labelWidth) / 2
        //label中心移动的y距离
        let labelOffsetY = labelHeight / 2 + spacing / 2.0
        
        switch postion {
        case .left:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2)
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2)
        case .right:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2))
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageHeight + spacing/2), 0, imageHeight + spacing/2)
        case .top:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX)
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX)
        case .bottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX)
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX)
        }
    }
}
