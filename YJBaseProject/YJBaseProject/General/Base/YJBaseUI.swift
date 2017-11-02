//
//  YJBaseUI.swift
//  YJBaseProject
//
//  Created by 冯垚杰 on 2017/10/17.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

/**
 *  创建UITextField
 */
public func creatTextField(_ placeHolder:String,_ font:UIFont) -> UITextField {
    let textField = UITextField()
    textField.font = font
    textField.placeholder = placeHolder
    textField.leftViewMode = .always
    textField.clearButtonMode = .whileEditing
    
    return textField
}
/**
 *  此方法仅支持makeConstraints创建UITextField
 */
public func creatTextField(_ placeHolder:String,_ font:UIFont,_ superView:UIView,_ closure:(_ make:ConstraintMaker)->Void) -> UITextField {
    let textField = UITextField()
    textField.font = font
    textField.placeholder = placeHolder
    textField.leftViewMode = .always
    textField.clearButtonMode = .whileEditing
    superView.addSubview(textField)
    textField.snp.makeConstraints(closure)
    return textField
}
/**
 *  创建UITextView
 */
public func creatTextView(_ font:UIFont) -> UITextView {
    let textView = UITextView()
    textView.font = font
    return textView
}
/**
 *  此方法仅支持makeConstraints创建UITextView
 */
public func creatTextView(_ font:UIFont,_ superView:UIView,_ closure:(_ make:ConstraintMaker)->Void) -> UITextView {
    let textView = UITextView()
    textView.font = font
    superView.addSubview(textView)
    textView.snp.makeConstraints(closure)
    return textView
}
/**
 *  创建image
 */
public func creatImage(_ frame:CGRect,_ color:UIColor) -> UIImage {
    UIGraphicsBeginImageContext(frame.size)
    let content = UIGraphicsGetCurrentContext()!
    color.set()
    content.fill(frame)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
}
/**
 *  创建UILabel
 */
public func creatLable(_ font:UIFont,_ text:String?) -> UILabel {
    let lable = UILabel()
    lable.font = font
    lable.text = text
    return lable
}
/**
 *  此方法仅支持makeConstraints创建UILabel
 */
public func creatLable(_ font:UIFont,_ text:String?,_ superView:UIView,_ closure:(_ make:ConstraintMaker)->Void) -> UILabel {
    let lable = UILabel()
    lable.font = font
    lable.text = text
    superView.addSubview(lable)
    lable.snp.makeConstraints(closure)
    return lable
}
/**
 *  创建UIButton
 */
public func creatButton(_ title:String?,_ type:UIButtonType) -> UIButton {
    let btn = UIButton(type: type)
    btn.setTitle(title, for: .normal)
    return btn
}
/**
 *  此方法仅支持makeConstraints创建UIButton
 */
public func creatButton(_ title:String?,_ type:UIButtonType,_ superView:UIView,_ closure:(_ make:ConstraintMaker)->Void) -> UIButton {
    let btn = UIButton(type: type)
    btn.setTitle(title, for: .normal)
    superView.addSubview(btn)
    btn.snp.makeConstraints(closure)
    return btn
}
/**
 *  创建UIImageView
 */
public func creatImageView(_ image:UIImage?) -> UIImageView {
    let imageview = UIImageView()
    imageview.image = image
    imageview.backgroundColor = .clear
    return imageview
}
/**
 *  此方法仅支持makeConstraints创建UIImageView
 */
public func creatImageView(_ image:UIImage?,_ superView:UIView,_ closure:(_ make:ConstraintMaker)->Void) -> UIImageView {
    let imageview = UIImageView()
    imageview.image = image
    imageview.backgroundColor = .clear
    superView.addSubview(imageview)
    imageview.snp.makeConstraints(closure)
    return imageview
}
/**
 *  创建UITableView
 */
public func creatTabView(_ mySelf:UIViewController,_ style:UITableViewStyle) -> UITableView {
    let tab = UITableView(frame: .zero, style: style)
    tab.backgroundColor = .clear
    tab.delegate = mySelf as? UITableViewDelegate
    tab.dataSource = mySelf as? UITableViewDataSource
    mySelf.view.addSubview(tab)
    return tab
}
/**
 *  此方法仅支持makeConstraints创建UITableView
 */
public func creatTabView(_ mySelf:UIViewController,_ style:UITableViewStyle,_ closure:(_ make:ConstraintMaker)->Void) -> UITableView {
    let tab = UITableView(frame: .zero, style: style)
    tab.backgroundColor = .clear
    tab.delegate = mySelf as? UITableViewDelegate
    tab.dataSource = mySelf as? UITableViewDataSource
    mySelf.view.addSubview(tab)
    tab.snp.makeConstraints(closure)
    return tab
}
/**
 *  设置barItem
 */
public func setBarItem(_ mySelf:UIViewController,_ title:String,_ titleColor:UIColor,_ action:Selector,_ isRight:Bool) {
    let size = title.boundingRect(with: CGSize.init(width: CGFloat(MAXFLOAT), height: 25), options: [NSStringDrawingOptions.usesFontLeading,NSStringDrawingOptions.usesLineFragmentOrigin], attributes: [NSAttributedStringKey.font:Font(16)], context: nil).size
    
    let btnCustom = UIButton(type: .custom)
    btnCustom.setTitle(title, for: .normal)
    btnCustom.titleLabel?.font = Font(16)
    btnCustom.titleLabel?.textAlignment = .left
    btnCustom.setTitleColor(titleColor, for: .normal)
    btnCustom.frame = .init(x: 0, y: 0, width: size.width+1, height: 25)
    btnCustom.addTarget(mySelf, action: action, for: .touchUpInside)
    let rightItem = UIBarButtonItem(customView: btnCustom)
    rightItem.target = mySelf
    rightItem.action = action
    if isRight {
        mySelf.navigationItem.rightBarButtonItem = rightItem
    }else{
        mySelf.navigationItem.leftBarButtonItem = rightItem
    }
}
/**
 *  设置rightbarItem
 */
public func setRightItem(_ mySelf:UIViewController,_ title:String,_ titleColor:UIColor,_ action:Selector){
    setBarItem(mySelf, title, titleColor,action, true)
}
/**
 *  设置NavTitle
 */
public func setNavTitle(_ mySelf:UIViewController,_ color:UIColor,_ font:UIFont) {
    mySelf.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:color,NSAttributedStringKey.font:font]
    
}
/**
 *  设置BackItem
 */
public func setBackItem(_ title:String,_ image:UIImage) {
    
    UINavigationBar.appearance().backIndicatorTransitionMaskImage = image.withRenderingMode(.alwaysOriginal)
    UINavigationBar.appearance().backIndicatorImage = image.withRenderingMode(.alwaysOriginal)
    
}
/**
 *  设置BarAttribute
 */
public func setBarAttribute(_ navBarColor:UIColor,_ navBarTintColor:UIColor, _ tabBarColor:UIColor, _ tabBarTintColor:UIColor) {
    UITabBar.appearance().barTintColor = tabBarTintColor
    UITabBar.appearance().tintColor = tabBarColor
    UINavigationBar.appearance().barTintColor = navBarTintColor
    UINavigationBar.appearance().tintColor = navBarColor
}
