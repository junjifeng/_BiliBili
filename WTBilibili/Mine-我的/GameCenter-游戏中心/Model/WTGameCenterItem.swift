//
//  WTGameCenterItem.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/6/12.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  游戏中心模型

import UIKit
/*
 "id":34,
 "title":"ICHU偶像进行曲",
 "summary":"把我变成真正的偶像吧！",
 "download_link":"http://acg.tv/u15b",
 "cover":"http://i2.hdslb.com/u_user/bf4e35133f507513abffc242967b2287.jpg",
 "hot":0,
 "new":0
 
 */
class WTGameCenterItem: NSObject
{
    // MARK: - 属性
    var id: Int = 0
    
    var title: String!
    
    var summary: String!
    
    var download_link: String!
    
    var cover: String!
    
    var hot: Int = 0
    
    var new: Int = 0
    
    init(dict: [String: AnyObject])
    {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
}
