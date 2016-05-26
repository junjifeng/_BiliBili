//
//  WTSignTool.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/11.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  sign生成器

import UIKit
import YYCategories

let APP_KEY = "4ebafd7c4951b366"

let APP_SECRET = "8cb98205e9b2ad3669aad0fce12a4c13"

class WTSignTool: NSObject {
    
    static func encodeHomeLiveDetailSign418(room_id: Int) -> String
    {
        let param = "_device=iphone&_hwid=a1761fdacd4633fd&_ulv=10000&access_key=a2dbcc35a5ddf9f2d2222ccedef1e5b4&appkey=\(APP_KEY)&appver=3220&build=3220&buld=3220&platform=ios&room_id=\(room_id)&type=json\(APP_SECRET)"
        return param.md5()
    }
    
    static func encodeHomeLiveDetailSign420(room_id: Int, timeInterval: Int) -> String
    {
        let param = "actionKey=appkey&appkey=\(APP_KEY)&build=3300&device=phone&platform=ios&room_id=\(room_id)&ts=\(timeInterval)\(APP_SECRET)"
        return param.md5()
    }
}
