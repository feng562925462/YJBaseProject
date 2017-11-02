//
//  LoginAndRegisterAPI.swift
//  YJBaseProject
//
//  Created by 冯垚杰 on 2017/10/20.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import Foundation


enum LoginAndRegisterAPI {
    /// 登录校验
    case logOnCheck(username:String?, password:String?)
    
    /// 注册校验用户名
    case checkLoginName
    
    /// 注册
    case register
    
    /// 退出登录
    case logOut
    
    /// 修改密码
    case changePassword
    
    /// 发送找回密码的验证码
    case sendGetBackPwdVerifyCode
    
    /// 验证短信验证码
    case validGetBackPwdVerifyCode
    
    /// 更新密码
    case updatePasswordBySmsVerifyCode
}

extension LoginAndRegisterAPI : NetworkBaseAPI {
    var parameters: [String : Any] {
        
        switch self {
            
        case .logOnCheck(let username,let password):
            
            var par : [String : Any] = [:]
            
            if username != nil {
                par["j_username"] = username!
            } else {
                printLog("无用户名")
            }
            
            if password != nil {
                par["j_password"] = password!
            } else {
                printLog("无密码")
            }
            return par
        default:
            return [:]
        }
    }
    
    var path: String {
        switch self {
        case .logOnCheck:
            return "/j_spring_security_check"
        case .checkLoginName:
            return "/orgmgt/user!checkLoginName.shtml"
        case .register:
            return "/orgmgt/user!saveRegister.shtml"
        case .logOut:
            return "/j_spring_security_logout"
        case .changePassword:
            return "/mobile!saveUserPwd.shtml"
        case .sendGetBackPwdVerifyCode:
            return "/mobile!sendGetBackPwdVerifyCode.shtml?intercept=false"
        case .validGetBackPwdVerifyCode:
            return "/mobile!validGetBackPwdVerifyCode.shtml?intercept=false"
        case .updatePasswordBySmsVerifyCode:
            return "/mobile!updatePasswordBySmsVerifyCode.shtml?intercept=false"
        }
        
    }
}

