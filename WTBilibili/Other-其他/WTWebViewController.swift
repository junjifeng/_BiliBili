//
//  WTWebViewController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/6/13.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

class WTWebViewController: UIViewController {

    // MARK: - 属性
    /// webView
    @IBOutlet weak var webView: UIWebView!
    /// 加载的url
    var url: String?
    
    // 系统回调函数
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // 设置UI
        setupUI()
    }
}

// MARK: - 自定义函数
extension WTWebViewController
{
    // MARK: 设置UI
    private func setupUI()
    {
        // 设置导航栏
        setupNav()
        
        // 加载url
        let request = NSURLRequest(URL: NSURL(string: url!)!)
        webView.loadRequest(request)
    }
    
    // MARK: 设置导航栏
    private func setupNav()
    {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", titleColor: UIColor(hexString: "A7506A")!, target: self, action: #selector(returnItemClick))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "分享", titleColor: UIColor(hexString: "A7506A")!, target: self, action: #selector(shareItemClick))
    }
}

// MARK: - 事件
extension WTWebViewController
{
    // MARK: 返回按钮点击
    func returnItemClick()
    {
        navigationController?.popViewControllerAnimated(true)
    }
    
    // MARK: 分享按钮点击
    func shareItemClick()
    {
    
    }
}

// MARK: - UIWebViewDelegate
extension WTWebViewController: UIWebViewDelegate
{
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        guard var urlTemp = request.URL?.absoluteString else
        {
            return false
        }
        
        // 跳转至app store
        if (urlTemp.containsString("itunes")) {
            urlTemp = urlTemp.stringByReplacingOccurrencesOfString("https", withString: "itms-apps")
            UIApplication.sharedApplication().openURL(NSURL(string: urlTemp)!)
            return false
        }
        return true;
    }
}