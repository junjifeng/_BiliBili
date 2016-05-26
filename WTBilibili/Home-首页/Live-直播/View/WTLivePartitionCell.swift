//
//  WTLivePartitionCell.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/8.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit
import SnapKit

class WTLivePartitionCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var liveListContentView: UIView!
    
    weak var liveListView: WTLiveListCollectionView!
    
    /// 推荐模型
    var partitionsItem: WTPartitionsItem?{
        didSet{
            
            titleLabel.text = partitionsItem?.partition?.name
            
            liveListView.lives = partitionsItem?.lives
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
extension WTLivePartitionCell
{
    // MARK: 设置UI
    private func setupUI()
    {
        // 1、添加子控件
        let liveListView = WTLiveListCollectionView(frame: CGRectZero, collectionViewLayout: WTVideoListLayout())
        liveListContentView.addSubview(liveListView)
        self.liveListView = liveListView
        
        // 2、布局子控件
        liveListView.snp_makeConstraints { (make) in
            make.edges.equalTo(EdgeInsetsMake(0, left: 0, bottom: 0, right: 0))
        }
    }
}


extension WTLivePartitionCell
{
    
}
