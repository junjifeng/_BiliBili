//
//  WTMineItem.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/6/1.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

class WTMineItem: NSObject
{
    var imageName: String!
    
    var title: String!
    
    var actionBlock: (() -> ())?
    
    init(imageName: String, title: String, actionBlock: (() -> ())?) {
        
        super.init()
        self.imageName = imageName
        self.title = title
        self.actionBlock = actionBlock
    }
}
