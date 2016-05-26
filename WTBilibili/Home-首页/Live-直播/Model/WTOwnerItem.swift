//
//  WTOwnerItem.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/9.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit
/*
 "face":"http://i1.hdslb.com/bfs/face/8f2caa3398e2d0d74108c881b6608a40d13686b2.jpg",
 "mid":24059162,
 "name":"咪酿"
 
 */
class WTOwnerItem: NSObject
{

    var face: NSURL?
    
    var mid = 0
    
    var name: String!
    
    init(dict: [String: AnyObject])
    {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
    override var description: String
    {
        let dict = dictionaryWithValuesForKeys(["face", "mid", "name"])
        
        return dict.description
    }
}
