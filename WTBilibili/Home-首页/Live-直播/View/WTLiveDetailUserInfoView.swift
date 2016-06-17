//
//  WTLiveDetailUserInfoView.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/26.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  直播详情页面中用户信息的View

import UIKit
import SDWebImage

class WTLiveDetailUserInfoView: UIView
{
    // MARK: - 拖线的控件
    /// 头像
    @IBOutlet weak var faceImageV: UIImageView!
    /// 标题
    @IBOutlet weak var titleLabel: UILabel!
    /// 排名
    @IBOutlet weak var master_levelBtn: UIButton!
    /// 名称
    @IBOutlet weak var nameLabel: UILabel!
    /// 关注按钮
    @IBOutlet weak var attentionLabel: UILabel!
    /// 关注人数
    @IBOutlet weak var followOperationBtn: UIButton!
    
    /// 直播详情模型
    var liveDetailItem: WTLiveDetailItem?{
        didSet{
            
            guard let liveDetailItemTemp = liveDetailItem else
            {
                return
            }
            
            // 头像
            faceImageV.sd_setImageWithURL(liveDetailItemTemp.m_face)
            
            // 标题
            titleLabel.text = liveDetailItemTemp.title
            
            // 名称 
            nameLabel.text = liveDetailItemTemp.uname
            
            // 排名
            master_levelBtn.setTitle("UP\(liveDetailItemTemp.master_level)", forState: .Normal)
            
            // 排名按钮背景色
            master_levelBtn.backgroundColor = UIColor(hex: liveDetailItemTemp.master_level_color)
            
            // 关注
            //attentionLabel.text = "\(liveDetailItemTemp.attention)"
            
        }
    }
    
    override func awakeFromNib() {
        // 设置UI
        setupUI()
    }
}

// MARK: - 自定义函数
extension WTLiveDetailUserInfoView
{
    // MARK: 快速创建地类方法
    static func liveDetailUserInfoView() -> WTLiveDetailUserInfoView
    {
        return NSBundle.mainBundle().loadNibNamed("WTLiveDetailUserInfoView", owner:  nil, options: nil).last as! WTLiveDetailUserInfoView
    }
    
    // MARK: 设置UI
    private func setupUI()
    {
        // 头像
        faceImageV.layer.cornerRadius = self.faceImageV.frame.size.width * 0.5
        faceImageV.layer.masksToBounds = true
        
        // 排名
        master_levelBtn.layer.cornerRadius = 1.5
        master_levelBtn.layer.masksToBounds = true
        
        // 名称
        nameLabel.textColor = WTMainColor
        
        // 关注按钮
//        followOperationBtn.setTitleColor(WTMainColor, forState: .Normal)
//        followOperationBtn.layer.cornerRadius = 3
//        followOperationBtn.layer.masksToBounds = true
//        followOperationBtn.layer.borderColor = WTMainColor.CGColor
//        followOperationBtn.layer.borderWidth = 1
    }
}
