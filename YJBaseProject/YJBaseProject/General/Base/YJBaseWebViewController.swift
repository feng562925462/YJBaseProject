//
//  YJBaseWebViewController.swift
//  YJBaseProject
//
//  Created by 冯垚杰 on 2017/10/30.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import UIKit
import WebKit

class YJBaseWebViewController: YJBaseViewController {

 
//    var webView : WKWebView = {
//        // 设置偏好设置
//        let webConfig = WKWebViewConfiguration()
//        webConfig.preferences = WKPreferences()
//        webConfig.preferences.minimumFontSize = 10; // 默认为0
//        webConfig.preferences.javaScriptEnabled = true
//        webConfig.preferences.javaScriptCanOpenWindowsAutomatically = false // 在iOS上默认为NO，表示不能自动通过窗口打开
//        return
//    }()
    
    let urlStr : String? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }
    



}

// MARK:- WKUIDelegate
extension YJBaseViewController : WKUIDelegate {
    
}
// MARK:- WKScriptMessageHandler
extension YJBaseViewController : WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
    }
    
    
}

