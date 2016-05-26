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
 
 
     "title":"5月9日15点直播俄罗斯2016红场大阅兵",
     "img":"http://i0.hdslb.com/bfs/live/b40470548ac2046ace4b1aa03a22144f895de289.jpg",
     "remark":"5月9日15点直播俄罗斯2016红场大阅兵",
     "link":"bilibili://live/46936"
 */
class WTBannerItem: NSObject
{
    /// 标题
    var title: String!
    /// 链接
    var value: String!
    /// 图片链接
    var image: NSURL?
    /// 图片链接 -> 首页直播
    var img: NSURL?
    
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
        let dict = dictionaryWithValuesForKeys(["title", "value", "image", "type", "img"])
        return dict.description
    }
}
