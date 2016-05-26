//
//  WTLiveDetailItem.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/10.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit
/*
     "room_id":22361,
     "title":"❤没事可做的直播间",
     "cover":"http://i0.hdslb.com/bfs/live/1c17840ab152e19f7f3a2a33069b56649660c40a.jpg?05101931",
     "mid":1111078,
     "uname":"明希kirara",
     "face":"http://i1.hdslb.com/bfs/face/4130261f8b54c97d751588fdae1b39af3b956879.jpg",
     "m_face":"http://i1.hdslb.com/bfs/face/4130261f8b54c97d751588fdae1b39af3b956879.jpg",
     "background_id":1,
     "attention":0,
     "online":66,
     "create":1434427626,
     "create_at":"2015-06-16 12:07:06",
     "sch_id":0,
     "status":"LIVE",
     "schedule":Object{...},
     "meta":Object{...},
     "cmt":"livecmt-2.bilibili.com",
     "vip":0,
     "svip":0
 */
class WTLiveDetailItem: NSObject
{
    var room_id: Int = 0
    
    var title: String!
    
    var cover: NSURL?
    
    var mid: Int = 0
    
    var uname: String!
    
    var face: NSURL?
    
    var m_face: NSURL?
    
    var background_id: Int = 0
    /// 关注人数
    var attention: Int = 0
    
    var online: Int = 0
    
    var create: Int = 0
    
    var create_at: String!
    
    var sch_id: Int = 0
    
    var status: String!
    
    var schedule: WTLiveDetailScheduleItem!
    
    var meta: WTLiveDetailMetaItem!
    
    var cmt: String!
    
    var vip: Int = 0
    
    var svip: Int = 0
    /// 排名
    var master_level: Int = 0
    /// 排名的颜色
    var master_level_color: Int = 0
    
    
    // MARK: - 自定义初始化函数
    init(dict: [String: AnyObject])
    {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
        
        if let scheduleTemp = dict["schedule"] as? [String: AnyObject]
        {
            schedule = WTLiveDetailScheduleItem(dict: scheduleTemp)
        }
        
//        if let metaTemp = dict["meta"] as? [String: AnyObject]
//        {
//            meta = WTLiveDetailMetaItem(dict: metaTemp)
//        }
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
}
