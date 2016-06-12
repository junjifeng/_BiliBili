//
//  WTRegisterVerifyPhoneViewController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/6/12.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  验证手机号

import UIKit

class WTRegisterVerifyPhoneViewController: UIViewController {

    // MARK: - 拖线的属性
    // 手机号 Label
    @IBOutlet weak var countryCodeAndPhoneNumberLabel: UILabel!
    // 下一步按钮 Button
    @IBOutlet weak var nextBtn: UIButton!
    
    // MARK: - 属性
    // 手机号
    var countryCodeAndPhoneNumber: String?
    
    // MARK: - 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置UI
        setupUI()
    }
}

// MARK: - 自定义函数
extension WTRegisterVerifyPhoneViewController
{
    // MARK: 设置UI
    private func setupUI()
    {
        // 手机号
        countryCodeAndPhoneNumberLabel.text = countryCodeAndPhoneNumber
        
        // 下一步
        nextBtn.layer.cornerRadius = 2
        nextBtn.layer.masksToBounds = true
    }
}
