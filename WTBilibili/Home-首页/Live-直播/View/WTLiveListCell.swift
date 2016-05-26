//
//  WTLiveListCell.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/9.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

class WTLiveListCell: UICollectionViewCell {

    // MARK: 控件
    /// 视频图片
    @IBOutlet weak var srcImageV: UIImageView!
    /// 头像
    @IBOutlet weak var faceImageV: UIImageView!
    /// 在线人数
    @IBOutlet weak var onlineBtn: UIButton!
    /// 名字
    @IBOutlet weak var nameLabel: UILabel!
    /// 标题
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: 
    var live: WTLiveItem?{
        didSet{
            
            guard let liveTemp = live else
            {
                return
            }
            
            /// 视频
            srcImageV.sd_setImageWithURL(liveTemp.cover.src)
            /// 头像
            faceImageV.sd_setImageWithURL(liveTemp.owner.face) { (image, error, _, _) in
                self.faceImageV.image = image.getImageWithBorder(3, color: UIColor.whiteColor())
            }
            /// 在线人数
            onlineBtn.setTitle("\(liveTemp.online)", forState: .Normal)
            /// 名字
            nameLabel.text = liveTemp.owner.name
            /// 标题
            titleLabel.text = liveTemp.title
        }
    }
    
    // MARK: 系统回调函数
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
}

