//
//  WTNotLoginView.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/7/3.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

protocol WTNotLoginViewDelegate: NSObjectProtocol
{
    func notLoginViewDidClickWithRegisterBtn()
    
    func notLoginViewDidClickWithLoginBtn()
}

class WTNotLoginView: UIView
{
    /// 代理
    var delegate: WTNotLoginViewDelegate?

    // MARK: - 拖线的属性
    /// 登录按钮
    @IBOutlet weak var registerBtn: UIButton!
    /// 注册按钮
    @IBOutlet weak var loginBtn: UIButton!
    
    // MARK: - 系统回调函数
    override func awakeFromNib()
    {
        // 设置View
        setupView()
    }

}

// MARK: - 自定义函数
extension WTNotLoginView
{
    // MARK: 快速创建的类方法
    static func notLoginView() -> WTNotLoginView
    {
        return NSBundle.mainBundle().loadNibNamed("WTNotLoginView", owner: nil, options: nil).last as! WTNotLoginView
    }
    
    // MARK: 设置View
    private func setupView()
    {
        backgroundColor = WTMainColor
        
        // 1、子控件基本属性
        registerBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        registerBtn.backgroundColor = UIColor(hexString: "#FAFAFA", alpha: 0.2)
        registerBtn.layer.cornerRadius = 3
        
        loginBtn.setTitleColor(WTMainColor, forState: .Normal)
        loginBtn.backgroundColor = UIColor.whiteColor()
        loginBtn.layer.cornerRadius = 3
        loginBtn.layer.masksToBounds = true
    }
   
}

// MARK: - 事件
extension WTNotLoginView
{
    // MARK: 注册
    @IBAction func registerBtnClick()
    {
        delegate?.notLoginViewDidClickWithRegisterBtn()
    }
    
    // MARK: 登录
    @IBAction func loginBtnClick()
    {
        delegate?.notLoginViewDidClickWithLoginBtn()
    }
}
