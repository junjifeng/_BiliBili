//
//  WTGameCenterCell.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/6/12.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

class WTGameCenterCell: UITableViewCell {

    // MARK: - 属性
    /// 图片 ImageView
    @IBOutlet weak var coverImageV: UIImageView!
    /// 标题 Label
    @IBOutlet weak var _titleLabel: UILabel!
    /// 详情 Label
    @IBOutlet weak var summaryLabel: UILabel!
    /// 下载 Button
    @IBOutlet weak var downloadBtn: UIButton!
    
    /// 游戏中心模型
    var gameCenterItem: WTGameCenterItem?{
        didSet{
            
            guard let gameCenterItemTemp = gameCenterItem else
            {
                return
            }
            
            // 图片
            coverImageV.sd_setImageWithURL(gameCenterItemTemp.cover)
            // 标题
            _titleLabel.text = gameCenterItemTemp.title
            // 详情
            summaryLabel.text = gameCenterItemTemp.summary
        }
    }
    
    // MARK: - 系统回调函数
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        // 设置UI
        setupUI()
    }
}

// MARK: - 自定义函数
extension WTGameCenterCell
{
    // MARK: 设置UI
    private func setupUI()
    {
        // 下载
        downloadBtn.layer.cornerRadius = 3
        downloadBtn.layer.masksToBounds = true
        downloadBtn.layer.borderColor = downloadBtn.titleLabel?.textColor.CGColor
        downloadBtn.layer.borderWidth = 1
    }
}

