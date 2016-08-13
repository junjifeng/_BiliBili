//
//  WTSearchHeaderCell.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/7/7.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

class WTSearchHeaderCell: UICollectionViewCell {

    /// 标题
    @IBOutlet weak var titleLabel: UILabel!
    
    var title: String?{
        didSet{
            titleLabel.text = title
        }
    }
    
    // MARK: - 系统回调函数
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        backgroundColor = UIColor(hexString: "#FFFFFF", alpha: 0.2)
        layer.cornerRadius = 5
        
        titleLabel.font = UIFont.setQIHeiFontWithSize(13)
        titleLabel.backgroundColor = UIColor.whiteColor()
    }
}
