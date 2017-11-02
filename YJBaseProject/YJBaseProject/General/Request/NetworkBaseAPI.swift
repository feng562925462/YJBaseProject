//
//  NetworkBaseAPI.swift
//  YJBaseProject
//
//  Created by 冯垚杰 on 2017/10/20.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import Foundation
import Moya

protocol NetworkBaseAPI : TargetType {
    /// 接口参数
    var parameters : [String : Any] {get}
}

extension NetworkBaseAPI {
    var baseURL: URL {
        return URL(string: NetworkHost.baseURLStr())!
    }
    var method: Moya.Method {
        return .post
    }
    
    var headers: [String : String]? {
        var par : [String : String] = [:]

        par["User-Agent"] = "IOS"
        par["Content-Type"] = "application/x-www-form-urlencoded"
        par["Connection"] = "close"
//        par["multipart/form-data"] = "Enctype"

        let userData : Dictionary = ["mobile_model":String.yj_deviceModelName(),
                        "sys_version":String.yj_systemVersion(),
                        "app_version":String.yj_appVersion() ?? "1.0",
                        "imei_num":String.yj_UUID() ?? "1111",
                        "user_agent":"IOS"
                        ]
        par["User-Data"] = userData.yj_jsonString(true)
        return par
    }
    
    /// 这个就是做单元测试模拟的数据，必须要实现，只在单元测试文件中有作用
    var sampleData : Data {
        
        return Data.init()
    }
    
    var task: Task {
        return Task.requestParameters(parameters: parameters, encoding: URLEncoding.default)
    }
}

//- (void)addHttpHeaderWith:(AFHTTPSessionManager *)manager {
//
//
//    NSDictionary *userData = @{@"mobile_model":[NSString yj_systemVersion],
//        @"sys_version":[[UIDevice currentDevice] systemVersion],
//        @"app_version":[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"],
//        @"imei_num":PhoneUUID ?: @"",
//        @"user_agent":@"IOS"};
//
//    NSMutableDictionary *mudic = [NSMutableDictionary dictionaryWithDictionary:userData];
//
//    if ([UserInfoTool getUserInfo] != nil && [UserInfoTool getUserInfo].userInfo ) {
//        [mudic setObject:[UserInfoTool getUserInfo].userInfo.id forKey:@"user_id"];
//    }
//
//    [manager.requestSerializer setValue:[self dictionaryToJson:mudic] forHTTPHeaderField:@"User-Data"];
//
//    if ([UserInfoTool getUserInfo]) {
//        NSString *cookieData = [NSString stringWithFormat:@"%@=%@;%@=%@",[UserInfoTool getUserInfo].sessionInfo.key,[UserInfoTool getUserInfo].sessionInfo.value,[UserInfoTool getUserInfo].sessionTokenInfo.key,[UserInfoTool getUserInfo].sessionTokenInfo.value];
//        [manager.requestSerializer setValue:cookieData forHTTPHeaderField:@"Cookie"];
//    }
//}

