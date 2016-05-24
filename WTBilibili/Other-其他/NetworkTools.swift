//
//  NetworkTools.swift
//  WTBilibili
//
//  Created by 耿杰 on 16/5/4.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  网络工具类

import UIKit
import AFNetworking

enum WTRequestMethod: String {
    case GET = "GET"
    case POST = "POST"
}

class NetworkTools: AFHTTPSessionManager
{
    // 单例
    static let shareInstance: NetworkTools = {
        let tools = NetworkTools()
        return tools
    }()
    
    ///  处理结果的Block
    let handleBlock = {(result: AnyObject?, error: NSError?, finished: (result: [[String: AnyObject]]?, error: NSError?) -> ()) -> Void in
        
        // 2.1、错误检验
        if error != nil
        {
            finished(result: nil, error: error)
            return
        }
        
        // 2.2、将AnyObject转成字典
        guard let resultDict = result else{
            finished(result: nil, error: NSError(domain: DOMAIN, code: -1011, userInfo: ["errorInfo": "将结果转成字典失败"]))
            return
        }
        
        // 2.3、从result字典取出数组
        guard let resultArray = resultDict["data"] as? [[String: AnyObject]] else {
            finished(result: nil, error: NSError(domain: DOMAIN, code: -1011, userInfo: ["errorInfo": "从字典中通过data取出字典数组失败"]))
            return
        }
        
        // 2.4、回调结果
        finished(result: resultArray, error: error)
    }
}

// MARK: - 封装网络请求
extension NetworkTools
{
    func request(method: WTRequestMethod, urlString: String, parameters: [String: AnyObject]?, finished: (result: AnyObject?, error: NSError?) -> ())
    {
        // 1、定义成功的回调闭包
        let success = {(task: NSURLSessionDataTask, result: AnyObject?) -> Void in
            finished(result: result, error: nil)
        }
        
        // 2、定义失败的回调闭包
        let failure = {(task: NSURLSessionDataTask?, error: NSError) -> Void in
            finished(result: nil, error: error)
        }
        
        // 3、发送请求
        if method == .GET
        {
            GET(urlString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
        else
        {
            POST(urlString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
    }
}

// MARK: - 首页->推荐
extension NetworkTools
{
    // MARK: 广告
    func loadHomeRecommendBanner(finished: (result: [[String: AnyObject]]?, error: NSError?)->())
    {
        // 1、url
        let urlString = "http://app.bilibili.com/x/banner?build=3170&channel=appstore&plat=2"
        
        // 2、发送请求
        request(.GET, urlString: urlString, parameters: nil) { (result, error) in
            
            self.handleBlock(result, error, finished)
        }
    }
}