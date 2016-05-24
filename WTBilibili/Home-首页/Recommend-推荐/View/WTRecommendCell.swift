//
//  WTRecommendCell.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/4.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit
import SnapKit

enum TitleType: String {
    case HOT = "热门推荐"
    case Live = "正在直播"
    case SomeDrama = "番剧推荐"
    case Animation = "动画区"
    case Music = "音乐区"
    case Dance = "舞蹈区"
    case Game = "游戏区"
    case Kichiku = "鬼畜区"
    case Science = "科学区"
    case TVPlay = "电视剧更新"
    case Movie = "电影区"
    case Fashion = "时尚区"
}

class WTRecommendCell: UITableViewCell
{

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var videoListContentView: UIView!
    weak var videoListView: WTVideoListCollectionView!
    
    /// 推荐模型
    var recommendItem: WTRecommendItem?{
        didSet{
            
            titleLabel.text = recommendItem?.title
            
            videoListView.videos = recommendItem?.body
            
//            switch recommendItem!.title {
//            case .HOT:
//                print("1")
//            default:
//                print("1")
//            }
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
extension WTRecommendCell
{
    // MARK: 设置UI
    private func setupUI()
    {
        // 1、添加子控件
        let videoListView = WTVideoListCollectionView(frame: CGRectZero, collectionViewLayout: WTVideoListLayout())
        videoListContentView.addSubview(videoListView)
        self.videoListView = videoListView
        
        // 2、布局子控件
        videoListView.snp_makeConstraints { (make) in            
            make.edges.equalTo(EdgeInsetsMake(0, left: 0, bottom: 0, right: 0))
        }
    }
}


