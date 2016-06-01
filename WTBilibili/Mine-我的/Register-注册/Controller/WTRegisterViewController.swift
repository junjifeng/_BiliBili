//
//  WTRegisterViewController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/6/1.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

class WTRegisterViewController: UIViewController {

    // MARK: - 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置UI
        setupUI()
    }
}

// MARK: - 自定义函数
extension WTRegisterViewController
{
    // MARK: 设置UI
    private func setupUI()
    {
        title = "注册帐号"
    }
}
