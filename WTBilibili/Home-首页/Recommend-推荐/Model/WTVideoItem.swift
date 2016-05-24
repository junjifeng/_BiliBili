//
//  WTRecommendBodyItem.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/4.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit
/*
     "title":"[玩客轻体验]乐视手机乐2&乐Max2上手体验(下)--系统+跑分+拍照@爱玩客iVankr",
     "cover":"http://i0.hdslb.com/bfs/archive/238fb140dd0036534c9160e9b30a310b54146a6a.jpg_320x200.jpg",
     "param":"4420343",
     "play":4972,
     "danmaku":274,
     "finish":0
 */

class WTVideoItem: NSObject
{
    var title: String!
    
    var cover: NSURL!
    
    var param: String!
    
    var play: Int = 0
    
    var danmaku: Int = 0
    
    var finish: Int = 0
    
    // MARK: - 自定义构造函数
    init(dict: [String: AnyObject])
    {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
    override var description: String
    {
        let dict = dictionaryWithValuesForKeys(["title", "cover", "param"])
        return dict.description
    }
}
