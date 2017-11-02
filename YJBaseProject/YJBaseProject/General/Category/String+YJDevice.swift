//
//  String+YJDevice.swift
//  YJBaseProject
//
//  Created by 冯垚杰 on 2017/10/23.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import UIKit

extension UIDevice {
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
}

extension String {
    // MARK:- 获取当前设备名
    /**
     获取当前设备名
     @return 例如：iphone 6
     */
    static func yj_deviceModelName() -> String {
//        struct utsname systemInfo;
    
//        var systemInfo = utsname()
//        uname(&systemInfo)
//        var deviceModel = String.init(cString: systemInfo.machine, encoding: String.Encoding.utf8)
        let deviceModel = UIDevice.current.modelName
        /**
         * CDMA电信3G的网络模式
         * GSM是通用的移动联通电信2g模式
         * WCDMA是联通3G的网络模式
         * TD—SCDMA是移动3G
         * 如果有TD-LTE或者FDD-LTE，则证明支持4g网络
         */
    
        var deviceModelDict = [
            //iPhone 系列
            "iPhone1,1":"iPhone 1G",
            "iPhone1,2":"iPhone 3G",
            "iPhone2,1":"iPhone 3GS",
            "iPhone3,1":"iPhone 4",
            "iPhone3,2":"Verizon iPhone 4",
            "iPhone4,1":"iPhone 4S",
            "iPhone5,1":"iPhone 5",
            "iPhone5,2":"iPhone 5",
            "iPhone5,3":"iPhone 5C",
            "iPhone5,4":"iPhone 5C",
            "iPhone6,1":"iPhone 5S",
            "iPhone6,2":"iPhone 5S",
            "iPhone7,1":"iPhone 6 Plus",
            "iPhone7,2":"iPhone 6",
            "iPhone8,1":"iPhone 6s",
            "iPhone8,2":"iPhone 6s Plus",
            "iPhone9,1":"iPhone 7 (CDMA)",
            "iPhone9,3":"iPhone 7 (GSM)",
            "iPhone9,2":"iPhone 7 Plus (CDMA)",
            "iPhone9,4":"iPhone 7 Plus (GSM)",
            "iPhone10,1" : "iPhone 8",
            "iPhone10,4" : "iPhone 8",
            "iPhone10,2" : "iPhone 8 Plus",
            "iPhone10,5" : "iPhone 8 Plus",
            "iPhone10,3" : "iPhone X",
            "iPhone10,6" : "iPhone X",
            
            //iPod 系列
            "iPod1,1":"iPod Touch 1G",
            "iPod2,1":"iPod Touch 2G",
            "iPod3,1":"iPod Touch 3G",
            "iPod4,1":"iPod Touch 4G",
            "iPod5,1":"iPod Touch 5G",
            
            //iPad 系列
            
            //iPad
            "iPad1,1":"iPad",
            "iPad2,1":"iPad 2 (WiFi)",
            "iPad2,2":"iPad 2 (GSM)",
            "iPad2,3":"iPad 2 (CDMA)",
            "iPad2,4":"iPad 2 (32nm)",
            "iPad3,1":"iPad 3(WiFi)",
            "iPad3,2":"iPad 3(CDMA)",
            "iPad3,3":"iPad 3(4G)",
            "iPad3,4":"iPad 4 (WiFi)",
            "iPad3,5":"iPad 4 (4G)",
            "iPad3,6":"iPad 4 (CDMA)",
            //iPad mini
            "iPad2,5":"iPad mini (WiFi)",
            "iPad2,6":"iPad mini (GSM)",
            "iPad2,7":"iPad mini (CDMA)",
            "iPad4,4":"iPad mini 2",
            "iPad4,5":"iPad mini 2",
            "iPad4,6":"iPad mini 2",
            "iPad4,7":"iPad mini 3",
            "iPad4,8":"iPad mini 3",
            "iPad4,9":"iPad mini 3",
            //iPad Air
            "iPad4,1":"iPad Air",
            "iPad4,2":"iPad Air",
            "iPad4,3":"iPad Air",
            "iPad5,3":"iPad Air 2",
            "iPad5,4":"iPad Air 2",
            // 模拟器
            "i386":"Simulator",
            "x86_64":"Simulator"
        ]
        
        return deviceModelDict[deviceModel] ?? deviceModel
    }
}

// MARK:- APP 信息
extension String {
    
    /// App的基本信息字典
    static func yj_appInfo() -> Dictionary<String, Any> {
        return Bundle.main.infoDictionary!
    }
    
    /// app名称
    static func yj_appName() -> String? {
        return self.yj_appInfo()["CFBundleDisplayName"] as? String
    }
    
    /// app版本
    static func yj_appVersion() -> String? {
        return self.yj_appInfo()["CFBundleShortVersionString"] as? String
    }
    
    /// appbuild版本
    static func yj_appBuild() -> String? {
        return self.yj_appInfo()["CFBundleVersion"] as? String
    }
    
    /// 手机别名： 用户定义的名称 例如：xxx的iphone
    static func yj_phoneAliases() -> String {
        return UIDevice.current.name
    }
    
    /// 设备名称 例如：iOS
    static func yj_deviceName() -> String {
        return UIDevice.current.systemName
    }
    
    /// 手机系统版本 例如：10.3
    static func yj_systemVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    /// 手机型号 例如：iPhone
    static func yj_phoneModel() -> String {
        return UIDevice.current.model
    }
    
    /// 地方型号  （国际化区域名称）
    static func yj_localizedModel() -> String {
        return UIDevice.current.localizedModel
    }
    
    /// 获取设备唯一标识符 例如：02FA87BD-B8A9-48AD-A9F2-93376C80AF33
    static func yj_UUID() -> String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
}


