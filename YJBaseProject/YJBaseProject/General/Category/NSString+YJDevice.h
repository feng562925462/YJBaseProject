//
//  NSString+YJDevice.h
//  YJBaseProject
//
//  Created by 冯垚杰 on 2017/8/19.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YJDevice)

/**
 获取当前设备名

 @return 例如：iphone 6
 */
+ (NSString *)yj_deviceModelName;


/**
 * 当前App的基本信息字典
 */
+ (NSDictionary *)yj_appInfo;

/**
 * app名称
 */
+ (NSString *)yj_appName;

/**
 * app版本
 */
+ (NSString *)yj_appVersion;

/**
 * app build版本
 */
+ (NSString *)yj_appBuild;

/**
 * 手机别名： 用户定义的名称 例如：xxx的iphone
 */
+ (NSString *)yj_phoneAliases;

/**
 * 设备名称 例如：iOS
 */
+ (NSString *)yj_deviceName;

/**
 * 手机系统版本 例如：10.3
 */
+ (NSString *)yj_systemVersion;

/**
 * 手机型号 例如：iPhone
 */
+ (NSString *)yj_phoneModel;

/**
 * 地方型号  （国际化区域名称）
 */
+ (NSString *)yj_localizedModel;

/**
 * 获取设备唯一标识符 例如：02FA87BD-B8A9-48AD-A9F2-93376C80AF33
 */
+ (NSString *)yj_UUID;

/**
 * 获取内网IP 例如：192.168.1.104
 */
+ (NSString *)yj_deviceIPAdress;
@end
