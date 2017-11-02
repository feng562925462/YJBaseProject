//
//  YJRootManager.swift
//  YJBaseProject
//
//  Created by 冯垚杰 on 2017/10/17.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import Foundation
import UIKit

open class YJRootManager: NSObject {
    
    public static let shareManager = YJRootManager()
    private override init(){
    }
    
    /**
     *  创建TabBar
     *  - window: window
     *  - controllers: tabBarVC的viewControllers
     *  - titles: tabBarItem的title
     *  - images: tabBarItem的image
     *  - selectImages: tabBarItem的selectimage
     */
//    open func creatRootVC(_ window:UIWindow,_ controllers:Array<AnyClass>,_ titles:Array<String>?,_ images:Array<UIImage>?,_ selectImages:Array<UIImage>?) {
//        
//     
//    }
    
    open func creatRootVC(_ window:UIWindow) {
        NotificationCenter.default.removeObserver(self)
        window.rootViewController = nil
        
        let tabbarC = YJBaseTabBarController()
        //        //首页
        //        tabbarC.addSubViewController(sbName: "Home", navIdentity: "HomeNav", norImage: "default1", selImage: "Select1", title: "home")
        //
        //        //视频教程
        //        tabbarC.addSubViewController(sbName: "Video", navIdentity: "VideoNav", norImage: "default2", selImage: "Select2", title: "video")
        //
        //        //分类搜索
        //        tabbarC.addSubViewController(sbName: "Search", navIdentity: "SearchNav", norImage: "default3", selImage: "Select3", title: "class")
        //
        //        //购物车
        //        tabbarC.addSubViewController(sbName: "ShopCar", navIdentity: "ShopCarNav", norImage: "default4", selImage: "Select4", title: "shopCar")
        //
        //        //会员中心
        //        tabbarC.addSubViewController(sbName: "Mine", navIdentity: "MineNav", norImage: "default5", selImage: "Select5", title: "mine")
        
        tabbarC.addChildViewController(vcName: "YJHomePageViewController", title: "首页", imageName: "")
        tabbarC.addChildViewController(vcName: "YJMyViewController", title: "我", imageName: "")
        tabbarC.selectedIndex = 0 //默认选择首页
        
        //设置TabBar的背景颜色
        tabbarC.tabBar.backgroundColor = UIColor.white
        tabbarC.tabBar.barTintColor = UIColor.white
        
        window.rootViewController = tabbarC
        window.makeKeyAndVisible()
    }
    
    /**
     *  创建登录页
     *  - window: window
     *  - controller: controller
     */
    open func creatLoginVC(_ window:UIWindow,_ controller:AnyClass) {
        
        NotificationCenter.default.removeObserver(self)
        window.rootViewController = nil
        
        let loginCls = controller as! UIViewController.Type
        let loginVC = loginCls.init()
        let nav = YJBaseNavigationController(rootViewController: loginVC)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
    
    
    /**
     *  创建启动页
     *  - window: window
     *  - controller: controller
     */
    open func creatIntroVC(_ window:UIWindow,_ controller:AnyClass) {
        
        let introCls = controller as! UIViewController.Type
        let introVC = introCls.init()
        window.rootViewController = introVC
        window.makeKeyAndVisible()
    }
}
