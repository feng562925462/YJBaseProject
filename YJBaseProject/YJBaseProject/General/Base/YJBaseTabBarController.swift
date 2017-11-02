//
//  YJBaseTabBarController.swift
//  YJBaseProject
//
//  Created by 冯垚杰 on 2017/10/16.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import UIKit

class YJBaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK:- 通过sb加载的vc添加vc
    @discardableResult
    func addSubViewController(sbName:String,navIdentity:String,norImage:String,selImage:String,title:String) -> UIViewController {
        
        let sb = UIStoryboard(name: sbName, bundle: nil)
    
        let navController = sb.instantiateViewController(withIdentifier: navIdentity)
        navController.tabBarItem.image = UIImage(named: norImage)
        navController.tabBarItem.selectedImage = UIImage(named: selImage)?.withRenderingMode(.alwaysOriginal)
        navController.tabBarItem.title = title
   navController.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:RGBCOLOR(r: 153, 153, 153),NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12)], for: .normal)
    navController.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:RGBCOLOR(r: 182, 28, 33),NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12)], for: .selected)

        addChildViewController(navController)
        return navController
    }
    
    // MARK:- 通过正常的vc名添加vc
    @discardableResult
    func addChildViewController(vcName:String,title:String,imageName:String)  -> UIViewController {

        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"]as! String
        
        let clsName = namespace + "." + vcName
        
        let cls = NSClassFromString(clsName) as! UIViewController.Type
        
        let vc = cls.init()
        
        vc.title = title
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.yellow], for: UIControlState.normal)
        
        vc.tabBarItem.image = UIImage(named: imageName)
        
        vc.tabBarItem.selectedImage = UIImage(named: "\(imageName)_select")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        let navVC = YJBaseNavigationController.init(rootViewController: vc)
        
        addChildViewController(navVC)
        return navVC
    }

    // MARK:- 去掉tabBar顶部线条
    func removeTabarTopLine() {
        let rect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        UIGraphicsBeginImageContext(rect.size)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(UIColor.clear.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        tabBar.backgroundImage = image
        tabBar.shadowImage = image
    }
}

