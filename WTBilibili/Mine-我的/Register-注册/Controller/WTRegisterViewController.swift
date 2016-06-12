//
//  WTRegisterViewController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/6/1.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  注册帐号控制器

import UIKit

class WTRegisterViewController: UIViewController {

    // MARK: - 拖线的属性
    /// 选择国家 Button
    @IBOutlet weak var countryBtn: UIButton!
    /// 国家代码 +86 Label
    @IBOutlet weak var countryCodeLabel: UILabel!
    /// 手机号 TextField
    @IBOutlet weak var phoneTextF: UITextField!
    /// 获取验证码 Button
    @IBOutlet weak var getCodeBtn: UIButton!
    /// 注册协议提示 Button
    @IBOutlet weak var registerAgreementBtn: UIButton!
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
        
        // 设置导航栏
        setupNav()
        
        // 获取验证码按钮
        getCodeBtn.layer.cornerRadius = 2
        getCodeBtn.layer.masksToBounds = true
        getCodeBtn.backgroundColor = WTRegisterGetCodeSelectedColor
        
        // 添加电话textField值改变的监听
        phoneTextF.addTarget(self, action: #selector(phoneTextFValueChange), forControlEvents: .EditingChanged)
    
        // 注册协议提示
        let attrText = NSMutableAttributedString(string: "点击\"获取验证码\"按钮，即表示同意注册协议")
        attrText.addAttributes([NSForegroundColorAttributeName: UIColor(hexString: "8C8C8C")!], range: NSRange(location: 0, length: 17))
        attrText.addAttributes([NSForegroundColorAttributeName: WTMainColor], range: NSRange(location: 17, length: 4))
        registerAgreementBtn.setAttributedTitle(attrText, forState: .Normal)
    }
    
    // MARK: 设置导航栏
    private func setupNav()
    {
        // 关闭按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem.createCloseItem(self, action: #selector(closeBtnClick))
    }
}

// MARK: - 事件函数
extension WTRegisterViewController
{
    // MARK: 关闭按钮
    func closeBtnClick()
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: 手机号输入监听
    func phoneTextFValueChange()
    {
        // 修改获取验证码的背景颜色和enabled -> 当手机号数为11位时
        if phoneTextF.text?.characters.count == 11
        {
            getCodeBtn.backgroundColor = WTRegisterGetCodeNormalColor
            getCodeBtn.enabled = true
        }
        else
        {
            getCodeBtn.backgroundColor = WTRegisterGetCodeSelectedColor
            getCodeBtn.enabled = false
        }
    }
    
    // MARK: 获取验证码点击
    @IBAction func getCodeBtnClick()
    {
        // 验证手机控制器
        let registerVerifyPhoneVC = WTRegisterVerifyPhoneViewController()
        registerVerifyPhoneVC.countryCodeAndPhoneNumber = countryCodeLabel.text! + " \(phoneTextF.text!)"
        navigationController?.pushViewController(registerVerifyPhoneVC, animated: true)
    }
    
    // MARK: 注册协议提示
    @IBAction func registerAgreementBtnClick()
    {
        // 注册协议控制器
        navigationController?.pushViewController(WTAgreementViewController(), animated: true)
    }
}
