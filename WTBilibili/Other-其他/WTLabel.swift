//
//  WTLabel.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/6/1.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

class WTLabel: UILabel
{

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        setupUI()
    }
}

// MARK: - 自定义函数
extension WTLabel
{
    // MARK: 设置UI
    private func setupUI()
    {
//        for f in UIFont.familyNames()
//        {
//            let name = UIFont.fontNamesForFamilyName(f)
//            WTLog("f:\(f)---name:\(name)")
//        }
        self.userInteractionEnabled = true
        self.textAlignment = .Center
        self.font = UIFont(name: "HYQiHei-EZJ", size: 16)
    }
    
    internal func setFontSize(size: CGFloat)
    {
        self.font = UIFont(name: "HYQiHei-EZJ", size: size)
    }
}
