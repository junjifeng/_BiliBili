//
//  WTLiveDetailScheduleItem.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/10.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit
/*
 "cid":22361,
 "sch_id":0,
 "title":"❤没事可做的直播间",
 "mid":1111078,
 "manager":[
 
 ],
 "start":1434427626,
 "start_at":"2015-06-16 12:07:06",
 "aid":0,
 "stream_id":13301,
 "online":66,
 "status":"LIVE",
 "meta_id":0,
 "pending_meta_id":0
 */
class WTLiveDetailScheduleItem: NSObject
{
    var cid: Int = 0
    
    var sch_id: Int = 0
    
    var title: String!
    
    var start: Int = 0
    
    var start_at: String!
    
    var aid: Int = 0
    
    var stream_id: Int = 0
    
    var online: Int = 0
    
    var status: String!
    
    var meta_id: Int = 0
    
    var pending_meta_id: Int = 0
    
    // MARK: - 自定义初始化函数
    init(dict: [String: AnyObject])
    {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
        
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
    
}
