//
//  WTPartitionItem.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/9.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

class WTPartitionItem: NSObject
{
    var id: Int = 0
    
    var name: String!
    
    var area: String!
    
    var sub_icon: WTIconItem?
    
    var count: Int = 0
    
    // MARK: - 自定义构造函数
    init(dict: [String: AnyObject])
    {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
        
        if let sub_iconTemp = dict["sub_icon"] as? [String: AnyObject]
        {
            sub_icon = WTIconItem(dict: sub_iconTemp)
        }
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
    override var description: String
    {
        let dict = dictionaryWithValuesForKeys(["id", "name", "area", "count", "sub_icon"])
        
        return dict.description
    }
}
