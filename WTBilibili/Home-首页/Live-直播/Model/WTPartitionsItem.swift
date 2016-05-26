//
//  WTPartitionsItem.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/8.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit
/*
 "id":8,
 "name":"萌宅推荐",
 "area":"subject",
 "sub_icon":{
 "src":"http://static.hdslb.com/live-static/images/mobile/ios/phone/8_s_2x.png?2016050501",
 "height":"40",
 "width":"40"
 },
 "count":35
 */
class WTPartitionsItem: NSObject
{
    var partition: WTPartitionItem!
    
    var lives: [WTLiveItem]!
    
    init(dict: [String: AnyObject])
    {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
        
        if let partitionTemp = dict["partition"] as? [String: AnyObject]
        {
            partition = WTPartitionItem(dict: partitionTemp)
        }
        
        if let livesTemp = dict["lives"] as? [[String: AnyObject]]
        {
            var lives = [WTLiveItem]()
            for liveTemp in livesTemp
            {
                
                lives.append(WTLiveItem(dict: liveTemp))
            }
            self.lives = lives
        }
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
    override var description: String
    {
        let dict = dictionaryWithValuesForKeys(["partition", "lives"])
        
        return dict.description
    }
}
