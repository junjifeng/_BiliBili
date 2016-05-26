//
//  WTEntranceCell.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/8.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

class WTEntranceCell: UITableViewCell {

    // MARK: - 系统回调函数
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        self.contentView.backgroundColor = WTHomeTableViewBackGroundColor
    }

}
