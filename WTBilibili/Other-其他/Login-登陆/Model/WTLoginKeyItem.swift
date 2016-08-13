//
//  WTLoginKeyItem.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/7/11.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit
/*
 {
	"ts": 1468224812,
	"hash": "892b8ec05e852357",
	"key": "-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCdScM09sZJqFPX7bvmB2y6i08J\nbHsa0v4THafPbJN9NoaZ9Djz1LmeLkVlmWx1DwgHVW+K7LVWT5FV3johacVRuV98\n37+RNntEK6SE82MPcl7fA++dmW2cLlAjsIIkrX+aIvvSGCuUfcWpWFy3YVDqhuHr\nNDjdNcaefJIQHMW+sQIDAQAB\n-----END PUBLIC KEY-----\n"
 }
 */
class WTLoginKeyItem: NSObject
{
    var ts: NSTimeInterval = 0
    
    var hashStr: String?
    
    var key: String?
    
    init(dict: [String: AnyObject])
    {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
        
        if let hashStrTemp = dict["hash"] as? String
        {
            hashStr = hashStrTemp
        }
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
}
