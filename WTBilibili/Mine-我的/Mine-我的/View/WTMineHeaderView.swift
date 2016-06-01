//
//  WTMineHeaderView.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/6/1.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

protocol WTMineHeaderViewDelegate: NSObjectProtocol {
    
    func headerViewWithRegisterLabelDidClick()
    
    func headerViewWithLoginLabelDidClick()
}

class WTMineHeaderView: UIView {

    weak var delegate: WTMineHeaderViewDelegate?
    
    // MARK: - 拖线的控件
    /// 注册按钮
    @IBOutlet weak var registerLabel: WTLabel!
    /// 登录按钮
    @IBOutlet weak var loginLabel: WTLabel!
    
    // MARK: - 系统回调函数
    override func awakeFromNib()
    {
        // 设置UI
        setupUI()
    }
}

// MARK: - 自定义函数
extension WTMineHeaderView
{
    // MARK: 快速创建的类方法
    static func headerView() -> WTMineHeaderView
    {
        return NSBundle.mainBundle().loadNibNamed("WTMineHeaderView", owner: nil, options: nil).last as! WTMineHeaderView
    }
    
    private func setupUI()
    {
        // 1、子控件基本属性
        registerLabel.layer.cornerRadius = 3
        registerLabel.layer.borderWidth = 1
        registerLabel.layer.borderColor = WTColor(r: 203, g: 203, b: 203).CGColor
        
        loginLabel.backgroundColor = WTMainColor
        loginLabel.layer.cornerRadius = 3
        loginLabel.layer.masksToBounds = true
        
        // 2、添加点击手势
        registerLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(registerLabelClick)))
        loginLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(loginLabelClick)))
    }
}

// MARK: - 事件
extension WTMineHeaderView
{
    func registerLabelClick()
    {
        delegate?.headerViewWithRegisterLabelDidClick()
    }
    
    func loginLabelClick()
    {
        delegate?.headerViewWithLoginLabelDidClick()
    }
}
