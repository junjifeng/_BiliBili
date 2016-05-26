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
        //        _instance.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", @"image/png",nil];
        tools.responseSerializer.acceptableContentTypes = NSSet(objects: "application/json", "text/json", "text/javascript", "text/html", "text/plain", "text/xml") as? Set<String>
        return tools
    }()
    
    ///  处理结果的Block
    let handleArrayBlock = {(result: AnyObject?, error: NSError?, finished: (result: [[String: AnyObject]]?, error: NSError?) -> ()) -> Void in
        
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
    
    ///  处理结果的Block
    let handleDictBlock = {(result: AnyObject?, error: NSError?, finished: (result: [String: AnyObject]?, error: NSError?) -> ()) -> Void in
        
        // 2.1、错误检验
        if error != nil
        {
            finished(result: nil, error: error)
            return
        }
        
        // 2.2、将AnyObject转成字典
        guard let resultDict = result else{
            print("error:\(result)")
            finished(result: nil, error: NSError(domain: DOMAIN, code: -1011, userInfo: ["errorInfo": "将结果转成字典失败"]))
            return
        }
        
        // 2.3、从result字典取出数组
        guard let dataResult = resultDict["data"] as? [String: AnyObject] else {
            print("error:\(result)")
            finished(result: nil, error: NSError(domain: DOMAIN, code: -1011, userInfo: ["errorInfo": "从字典中通过data取出字典数组失败"]))
            return
        }
        
        // 2.4、回调结果
        finished(result: dataResult, error: error)
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

// MARK: - 首页->直播
extension NetworkTools
{
    // 加载直播首页的数据
    func loadHomeLiveData(finished: (result: [String: AnyObject]?, error: NSError?) -> ())
    {
        // 1、url
        let urlString = "http://live.bilibili.com/AppIndex/home?access_key=a2dbcc35a5ddf9f2d2222ccedef1e5b4&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3170&device=phone&platform=ios&scale=2&sign=b8458855b19667a3a741d2686baea127&ts=1462706479"
        
        // 2、发送请求
        request(.GET, urlString: urlString, parameters: nil) { (result, error) in
            
            self.handleDictBlock(result, error, finished)
            
        }
    }
    
    // 根据room_id查询出直播详情信息
    func loadHomeLiveDetailData(room_id: Int, finished: (result: [String: AnyObject]?, error: NSError?) -> ())
    {
        
        // 1、url
        //let urlString418 = "http://live.bilibili.com/api/room_info?_device=iphone&_hwid=a1761fdacd4633fd&_ulv=10000&access_key=a2dbcc35a5ddf9f2d2222ccedef1e5b4&appkey=\(APP_KEY)&appver=3220&build=3220&buld=3220&platform=ios&room_id=\(room_id)&type=json&sign=\(WTSignTool.encodeHomeLiveDetailSign418(room_id))"
        
        let urlString420 = "http://live.bilibili.com/AppRoom/index?actionKey=appkey&appkey=\(APP_KEY)&build=3300&device=phone&platform=ios&room_id=\(room_id)&sign=\(WTSignTool.encodeHomeLiveDetailSign420(room_id, timeInterval: WTTimeInterval))&ts=\(WTTimeInterval)"
        
        // 2、发送请求
        request(.GET, urlString: urlString420, parameters: nil) { (result, error) in
            
            self.handleDictBlock(result, error, finished)
            
        }
    }
    
    // 根据cid获取直播地址
    func getLivePlayerURL(cid: Int, finished: (result: [String: AnyObject]?, error: NSError?) -> ())
    {
        // 1、url
        let urlString = "http://live.bilibili.com/api/playurl?player=1&quality=0&cid=\(cid)"
        
        // 2、发送请求
        // manager.responseSerializer = [AFHTTPResponseSerializer serializer]
        self.responseSerializer = AFHTTPResponseSerializer()
        
        request(.GET, urlString: urlString, parameters: nil) { (result, error) in
            print("result:\(result)")
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
            
            self.handleArrayBlock(result, error, finished)
        }
    }
}