//
//  WTAgreementViewController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/6/11.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  注册协议控制器

import UIKit

class WTAgreementViewController: UIViewController {

    // MARK: - 属性
    private let webView = UIWebView()
    
    // MARK: - 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置UI
        setupUI()
    }
}

// MARK: - 自定义函数
extension WTAgreementViewController
{
    // MARK: 设置UI
    private func setupUI()
    {
        title = "注册协议"
        
        // 1、添加子控件
        view.addSubview(webView)
        
        // 2、布局子控件
        webView.frame = view.bounds
        
        // 3、属性
        let htmlPath = NSBundle.mainBundle().pathForResource("register_licence.html", ofType: nil)!

        let htmlCont = try! String.init(contentsOfFile: htmlPath)
        let path = NSBundle.mainBundle().bundlePath
        let baseURL = NSURL.fileURLWithPath(path)
        webView.loadHTMLString(htmlCont, baseURL: baseURL)
    }
}
