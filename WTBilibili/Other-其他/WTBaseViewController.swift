//
//  WTBaseViewController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/7/5.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

let BaseHeaderViewH: CGFloat = 54

class WTBaseViewController: UIViewController {

    var headerView = UIView()
    
    var footerView = UIView()
    
    var headerViewH: CGFloat = 0
    
    /// 标题Label
    lazy var titleLabel: UILabel = {
        
        let titleLabel = UILabel()
        self.headerView.addSubview(titleLabel)
        
        titleLabel.sizeToFit()
        titleLabel.snp_makeConstraints(closure: { (make) in
            make.centerX.equalTo(self.headerView)
            make.top.equalTo(20)
            make.height.equalTo(34)
        })
        
        titleLabel.textColor = UIColor.whiteColor()
        return titleLabel
    }()
    
    // MARK: - 系统回调函数
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // 设置View
        setupView()
    }
}

// MARK: - 自定义函数
extension WTBaseViewController
{
    // MARK: 设置View
    private func setupView()
    {
        view.backgroundColor = WTMainColor
        
        // 1、添加子控件
        view.addSubview(headerView)
        view.addSubview(footerView)
        
        // 2、布局子控件
        headerView.backgroundColor = UIColor.clearColor()
        headerView.frame = CGRect(x: 0, y: 0, width: WTScreenWidth, height: BaseHeaderViewH)
        
        // 3、子控件属性
        headerView.backgroundColor = WTMainColor
        footerView.clipsToBounds = true
        footerView.layer.cornerRadius = 5
        
        
        footerView.backgroundColor = UIColor.whiteColor()
    }
}

