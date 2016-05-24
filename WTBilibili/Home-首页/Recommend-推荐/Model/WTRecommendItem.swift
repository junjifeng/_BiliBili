//
//  WTRecommendItem.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/4.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit
/* 
     "param":"36",
     "type":"region",
     "style":"medium",
     "title":"科技区",
     "body"
 */
class WTRecommendItem: NSObject
{
    var param: String!
    
    var type: String!
    
    var style: String!
    
    var title: String!
    
    var live_count: Int = 0
    
    var body: [WTVideoItem]!
    
    // MARK: - 自定义构造函数
    init(dict: [String: AnyObject])
    {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
        
        if let bodyDicts = dict["body"] as? [[String: AnyObject]]
        {
            var bodys = [WTVideoItem]()
            for bodyDict in bodyDicts
            {
                let video = WTVideoItem(dict: bodyDict)
                bodys.append(video)
            }
            body = bodys
        }
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
    override var description: String
    {
        let dict = dictionaryWithValuesForKeys(["param", "type", "style", "title", "live_count", "body"])
        return dict.description
    }
}
