//
//  WTBaseTableView.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/7/4.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

class WTBaseTableView: UITableView
{
    private var startPoint = CGPoint()
    
    private var endPoint = CGPoint()
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        startPoint = (touches.first?.locationInView(self))!
        
        WTLog("startPoint:\(startPoint)")
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touchesTemp = touches as NSSet
        
        endPoint = touchesTemp.anyObject()!.locationInView(self)
        
        WTLog("endPoint:\(endPoint)")
    }
}
