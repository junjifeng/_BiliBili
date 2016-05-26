//
//  Entrance_IconItem.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/8.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit
/*
 "src":"http://static.hdslb.com/live-static/images/mobile/ios/phone/11_big_2x.png?2016050501",
 "height":"100",
 "width":"100"
 */
class WTIconItem: NSObject
{
    var src: NSURL!
    
    var height: Int = 0
    
    var width: Int = 0
    
    init(dict: [String: AnyObject])
    {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
    override var description: String
    {
        let dict = dictionaryWithValuesForKeys(["src", "height", "width"])
        
        return dict.description
    }
}
