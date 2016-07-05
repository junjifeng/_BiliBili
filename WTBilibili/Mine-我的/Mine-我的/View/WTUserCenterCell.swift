//
//  WTUserCenterCell.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/7/3.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

private let topMargin: CGFloat = 44

class WTUserCenterCell: UITableViewCell {

    var headerView = UIView()
    
    var titleLabel = UILabel()
    
    var lineView = UIView()
    
    var userCenterItems: [WTUserCenterItem]? {
        didSet{
            
            guard let userCenterItemsTemp = userCenterItems else
            {
                return
            }
            
            let count = userCenterItemsTemp.count
            
            var x: CGFloat = 0
            var y: CGFloat = 0
            
            
            for i in 0..<count
            {
                let item = userCenterItemsTemp[i]
                
                let btn = WTUserCenterButton(type: .Custom)
                addSubview(btn)
                
                x = CGFloat(i % column) * UserCenterButtonW
                y = CGFloat(i / column) * UserCenterButtonH + topMargin
                btn.frame = CGRect(x: x, y: y, width: UserCenterButtonW, height: UserCenterButtonH)
                
                btn.tag = i
                btn.setTitle(item.title, forState: .Normal)
                btn.setImage(UIImage(named: item.imageName), forState: .Normal)
                btn.addTarget(self, action: #selector(userCenterBtnClick(_:)), forControlEvents: .TouchUpInside)
            }
            
            let surplusCount = column - count % column
            for i in 0..<surplusCount
            {
                let btn = WTUserCenterButton(type: .Custom)
                addSubview(btn)
                
                x = CGFloat((i + count) % column) * UserCenterButtonW
                y = CGFloat((i + count) / column) * UserCenterButtonH + topMargin
                btn.frame = CGRect(x: x, y: y, width: UserCenterButtonW, height: UserCenterButtonH)
            }
        }
    }
    
    var title: String?{
        didSet{
            
            titleLabel.text = title
            titleLabel.sizeToFit()
        }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        // 设置View
        setupView()
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        titleLabel.frame.origin.x = 12
        titleLabel.frame.origin.y = 13
        
        lineView.frame = CGRect(x: 0, y: self.frame.height - 10, width: WTScreenWidth, height: 1)
    }
}

// MARK: - WTUserCenterCell
extension WTUserCenterCell
{
    // MARK: 设置View
    private func setupView()
    {
        backgroundColor = UIColor.clearColor()
        
        // 1、添加子控件
        addSubview(headerView)
        addSubview(titleLabel)
        addSubview(lineView)
        
        // 2、子控件属性
        headerView.backgroundColor = UIColor.whiteColor()
        titleLabel.font = UIFont.systemFontOfSize(16)
        titleLabel.textColor = UIColor(hexString: "#212121")
        lineView.backgroundColor = UIColor(hexString: "#666666", alpha: 0.1)
        
        // 3、布局子控件
        headerView.frame = CGRect(x: 0, y: 0, width: WTScreenWidth, height: 44)
    }
}

// MARK: - 事件
extension WTUserCenterCell
{
    func userCenterBtnClick(userCenterBtn: WTUserCenterButton)
    {
        let actionBlock = userCenterItems![userCenterBtn.tag].actionBlock
        actionBlock!()
    }
}