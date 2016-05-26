//
//  WTLiveItem.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/9.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit
/*
 
 "owner":{
 "face":"http://i1.hdslb.com/bfs/face/6071be2076baa57add85dae9f462ff427695e1ca.jpg",
 "mid":881785,
 "name":"雪莹ユキ"
 },
 "cover":{
 "src":"http://i0.hdslb.com/group1/M00/AB/9F/oYYBAFbkScKAJjJ2AADA9EDuLSk797.jpg",
 "height":180,
 "width":320
 },
 "title":"户外直播友情麻将 周日19:00",
 "room_id":54869,
 "online":1037
 */
class WTLiveItem: NSObject
{
    var owner: WTOwnerItem!
    
    var cover: WTIconItem!
    
    var title: String!
    
    var room_id = 0
    
    var online = 0
    
    init(dict: [String: AnyObject])
    {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    
        if let ownerTemp = dict["owner"] as? [String: AnyObject]
        {
            owner = WTOwnerItem(dict: ownerTemp)
        }
        
        if let coverTemp = dict["cover"] as? [String: AnyObject]
        {
            cover = WTIconItem(dict: coverTemp)
        }
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
    override var description: String
    {
        let dict = dictionaryWithValuesForKeys(["owner", "cover", "title", "room_id", "online"])
        
        return dict.description
    }
}
