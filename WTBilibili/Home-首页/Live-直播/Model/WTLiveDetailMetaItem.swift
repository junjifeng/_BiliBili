//
//  WTLiveDetailMetaItem.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/10.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

/*
     "tag":{
        "0":"吃货",
        "1":"cosplay",
        "2":"户外直播"
     },
     "description":
     "typeid":1,
     "tag_ids":{
        "0":24
     },
     "cover":"http://i0.hdslb.com/bfs/live/1c17840ab152e19f7f3a2a33069b56649660c40a.jpg?05101931",
     "check_status":"VERIFY",
     "aid":0
 */

class WTLiveDetailMetaItem: NSObject
{
    var tag: [String]?
    
    var descriptionHTML: String!
    
    var typeid: Int = 0
    
    var tag_ids: [Int]?
    
    var cover: NSURL?
    
    var check_status: String!
    
    var aid: Int = 0
    
    // MARK: - 自定义初始化函数
    init(dict: [String: AnyObject])
    {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
        
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
}
