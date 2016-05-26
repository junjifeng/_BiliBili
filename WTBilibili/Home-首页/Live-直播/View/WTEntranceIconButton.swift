//
//  WTEntranceIconButton.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/8.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

/// 按钮图片的宽度、高度
let EntranceIconButtonImageWH: CGFloat = 40

/// 按钮标题的宽度
let EntranceIconButtonTitleW: CGFloat = 50

/// 按钮标题的高度
let EntranceIconButtonTitleH: CGFloat = 12

class WTEntranceIconButton: UIButton
{
    // MARK: - 系统回调函数
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        setTitleColor(UIColor.blackColor(), forState: .Normal)
        titleLabel?.font = UIFont.systemFontOfSize(12)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: 重新调整图片的位置
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect
    {
        let x = (self.frame.width - EntranceIconButtonImageWH) * 0.5
        
        return CGRect(x: x, y: 20, width: EntranceIconButtonImageWH, height: EntranceIconButtonImageWH)
    }
    
    // MARK: 重新调整标题的位置
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect
    {
        let x = (self.frame.width - EntranceIconButtonTitleW) * 0.5
        return CGRect(x: x, y: CGRectGetMaxY(imageView!.frame) + 5, width: EntranceIconButtonTitleW, height: EntranceIconButtonTitleH)
    }
}
