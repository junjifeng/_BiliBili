//
//  WTRecommendBannerItem.swift
//  WTBilibili
//
//  Created by 耿杰 on 16/5/4.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  首页推荐广告模型

import UIKit
/*
     "title":"douga",
     "value":"http://www.bilibili.com/topic/v2/phone1203.html",
     "image":"http://i0.hdslb.com/group1/M00/B7/32/oYYBAFcn-eWAf2RjAAFhSnQjpd0168.jpg",
     "type":2,
     "weight":200,
     "remark":"",
     "hash":"0"
 */
class WTRecommendBannerItem: NSObject
{
    /// 标题
    var title: String!
    /// 链接
    var value: String!
    /// 图片
    var image: NSURL?
    var type: Int = 0
    
    var weight: CGFloat?
    
    var remark: String?
    
    var hashStr: String?
    
    // MARK: - 自定义构造函数
    init(dict: [String: AnyObject])
    {
        super.init()

        setValuesForKeysWithDictionary(dict)
        
        if let hashTemp = dict["hash"] as? String {
            hashStr = hashTemp
        }
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
    override var description: String
    {
        let dict = dictionaryWithValuesForKeys(["title", "value", "image", "type"])
        return dict.description
    }
}
