//
//  YJHomePageViewController.swift
//  YJBaseProject
//
//  Created by 冯垚杰 on 2017/10/19.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON
import Alamofire

class YJHomePageViewController: YJBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let provider = MoyaProvider<LoginAndRegisterAPI>()

        provider.request(.logOnCheck(username: "101", password: "q101"), callbackQueue: nil, progress: { (progress) in
            printLog(progress)
        }) { (result) in

            switch result {
            case let .success(response):
                printLog(response.response)
                let responseData = JSON(data: response.data).dictionaryObject

                printLog(responseData?.yj_jsonString(false))

            case let .failure(error):
                printLog(error)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
