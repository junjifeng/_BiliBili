//
//  WTSeeMoreView.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/7/7.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  查看更多的View

import UIKit

protocol WTSeeMoreViewDelegate: NSObjectProtocol
{
    func seeMoreViewDidClick()
}

class WTSeeMoreView: UIView
{
    
    var delegate: WTSeeMoreViewDelegate?
    
    /// 查看更多
    @IBOutlet weak var seeMoreLabel: UILabel!
    @IBOutlet weak var seeMoreIconImageV: UIImageView!

    // MARK: - 系统回调函数
    override func awakeFromNib()
    {
        seeMoreIconImageV.image = UIImage(named: "search_openMore")?.imageWithTintColor(UIColor.whiteColor())
        // 1、添加点击事件
        seeMoreLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(seeMoreLabelClick)))
    }
}

// MARK: - 自定义函数
extension WTSeeMoreView
{
    // MARK: - 快速创建
    static func seeMoreView() -> WTSeeMoreView
    {
        return NSBundle.mainBundle().loadNibNamed("WTSeeMoreView", owner: nil, options: nil).last as! WTSeeMoreView
    }
}

// MARK: - 事件
extension WTSeeMoreView
{
    // MARK: - 查看Label点击事件
    func seeMoreLabelClick()
    {
        if seeMoreLabel.text == "查看更多"
        {
            seeMoreLabel.text = "收起"
            seeMoreIconImageV.image = UIImage(named: "search_closeMore")?.imageWithTintColor(UIColor.whiteColor())
        }
        else
        {
            seeMoreLabel.text = "查看更多"
            seeMoreIconImageV.image = UIImage(named: "search_openMore")?.imageWithTintColor(UIColor.whiteColor())
        }
        
        delegate?.seeMoreViewDidClick()
    }
}