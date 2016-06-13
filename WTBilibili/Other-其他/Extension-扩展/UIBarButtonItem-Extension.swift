//
//  UIBarButtonItem-Extension.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/6/12.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import Foundation

extension UIBarButtonItem
{
    public static func createCloseItem(target: AnyObject?, action: Selector) -> UIBarButtonItem
    {
        let closeBtn = UIButton(type: .Custom)
        closeBtn.tintColor = WTMainColor
        closeBtn.setBackgroundImage(UIImage(named: "common_close"), forState: .Normal)
        closeBtn.sizeToFit()
        closeBtn.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        return UIBarButtonItem(customView: closeBtn)
    }
    
    public convenience init(title: String, titleColor: UIColor,target: AnyObject?, action: Selector)
    {
        let btn = UIButton(type: .Custom)
        btn.setTitle(title, forState: .Normal)
        btn.setTitleColor(titleColor, forState: .Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(17)
        btn.sizeToFit()
        
        btn.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        self.init(customView: btn)
    }
}