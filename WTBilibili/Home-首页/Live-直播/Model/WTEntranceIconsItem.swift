
//
//  EntranceIconsItem.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/8.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

/*
    "id":11,
    "name":"手机直播"
     "entrance_icon":{
     "src":"http://static.hdslb.com/live-static/images/mobile/ios/phone/11_big_2x.png?2016050501",
     "height":"100",
     "width":"100"
 
 */
class WTEntranceIconsItem: NSObject
{
    var id: Int = 0
    
    var name: String!
    
    var entrance_icon: WTIconItem?
    
    // MARK: - 自定义构造函数
    init(dict: [String: AnyObject])
    {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
        
        if let entrance_iconTemp = dict["entrance_icon"] as? [String: AnyObject]
        {
           entrance_icon  = WTIconItem(dict: entrance_iconTemp)
        }
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
}
