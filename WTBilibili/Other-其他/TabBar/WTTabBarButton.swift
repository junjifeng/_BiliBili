//
//  WTTabBarButton.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/7/5.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

class WTTabBarButton: UIButton
{
    var tabBarItem: UITabBarItem? {
        didSet{
            
            setImage(tabBarItem?.image, forState: .Normal)
            setImage(tabBarItem?.selectedImage, forState: .Selected)
        }
    }
    
}
