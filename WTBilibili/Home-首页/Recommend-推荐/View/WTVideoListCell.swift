//
//  WTVideoListCell.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/4.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit
import SDWebImage

class WTVideoListCell: UICollectionViewCell {
    
    // MARK: - 控件
    /// 视频缩略图
    @IBOutlet weak var coverImageV: UIImageView!
    /// 标题
    @IBOutlet weak var titleLabel: UILabel!
    /// 播放量
    @IBOutlet weak var playLabel: UILabel!
    /// 未知
    @IBOutlet weak var danmakuLabel: UILabel!
    
    // MARK: 视频模型
    var video: WTVideoItem?{
        didSet{
            
            guard let videoTemp = video else
            {
                return
            }
            
            coverImageV.sd_setImageWithURL(videoTemp.cover)
            
            titleLabel.text = videoTemp.title
            
            playLabel.text = "\(videoTemp.play)"
            
            danmakuLabel.text = "\(videoTemp.danmaku)"
        }
    }
    
    // MARK: 系统回调函数
    override func awakeFromNib()
    {
        super.awakeFromNib()
      
        // 设置UI
        setupUI()
    }
}

// MARK: - 自定义函数
extension WTVideoListCell
{
    // MARK: 设置UI
    private func setupUI()
    {
        coverImageV.layer.cornerRadius = 5
        coverImageV.layer.masksToBounds = true
    }
}
