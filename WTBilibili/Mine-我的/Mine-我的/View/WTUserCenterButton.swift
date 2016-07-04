//
//  WTUserCenterButton.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/7/4.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

let UserCenterButtonH: CGFloat = 90

let column = 4

let UserCenterButtonW = WTScreenWidth / CGFloat(column)

class WTUserCenterButton: UIButton
{
    // MARK: - 系统回调函数
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        // 设置基本属性
        backgroundColor = UIColor.whiteColor()
        setTitleColor(UIColor.blackColor(), forState: .Normal)
        titleLabel?.font = UIFont.systemFontOfSize(14)
        
        let layer = CAShapeLayer()
        layer.frame = self.bounds
        let linePath = UIBezierPath()
        linePath.moveToPoint(CGPoint(x: 0, y: 0))
        linePath.addLineToPoint(CGPoint(x: UserCenterButtonW, y: 0))
        linePath.addLineToPoint(CGPoint(x: UserCenterButtonW, y: UserCenterButtonH))
        
        layer.path = linePath.CGPath
        layer.fillColor = UIColor.clearColor().CGColor
        layer.strokeColor = UIColor(hexString: "#666666", alpha: 0.1)?.CGColor
        self.layer.addSublayer(layer)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
     
        // 重新调整图片和标题的位置
        let imageViewWH: CGFloat = 25
        let imageViewX = (self.frame.width - imageViewWH) * 0.5
        imageView?.frame = CGRect(x: imageViewX, y: 25, width: 25, height: 25)
        
        titleLabel?.sizeToFit()
        let titleLabelX = (self.frame.width - titleLabel!.frame.width) * 0.5
        titleLabel?.frame = CGRect(x: titleLabelX, y: 60, width: titleLabel!.frame.width, height: titleLabel!.frame.height)
    }
}

