//
//  WTMineCell.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/6/1.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  我 自定义cell

import UIKit

class WTMineCell: UITableViewCell {

    // MARK: - 拖线的属性
    /// icon
    @IBOutlet weak var mineImageV: UIImageView!
    /// 标题
    @IBOutlet weak var mineTitleLabel: UILabel!
    
    var mineItem: WTMineItem?{
        didSet{
            
            guard let mineItemTemp = mineItem else
            {
                return
            }
            
            mineImageV.image = UIImage(named: mineItemTemp.imageName)
            mineTitleLabel.text = mineItemTemp.title
        }
    }
    
    // MARK: - 系统回调函数
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
    }
}
