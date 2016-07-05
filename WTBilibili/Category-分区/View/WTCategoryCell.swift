//
//  WTCategoryCell.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/7/4.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

class WTCategoryCell: UICollectionViewCell
{
    @IBOutlet weak var iconImageV: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    var userCenterItem: WTUserCenterItem? {
        didSet{
            
            guard let userCenterItemTemp = userCenterItem else
            {
                return
            }
            
            iconImageV.image = UIImage(named: userCenterItemTemp.imageName)
            
            titleLabel.text = userCenterItemTemp.title
            
        }
    }
}
