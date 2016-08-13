//
//  WTDiscoverCell.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/7/6.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

class WTDiscoverCell: UITableViewCell {
    
    // MARK: - 系统回调函数
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        accessoryType = .DisclosureIndicator
        
        textLabel?.font = UIFont.setQIHeiFontWithSize(14)
        textLabel?.textColor = UIColor(hexString: "#212121")
        
        layoutMargins = UIEdgeInsetsZero
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()

        // 重新调整imageView和textLabel的位置
        if imageView?.image?.size.height >= 20
        {
            imageView?.frame = CGRect(x: 24, y: 15, width: 20, height: 20)
        }
        else
        {
            imageView?.frame = CGRect(x: 20, y: 15, width: 28, height: 20)
        }
        
        textLabel?.frame.origin.x = 56
    }
}
