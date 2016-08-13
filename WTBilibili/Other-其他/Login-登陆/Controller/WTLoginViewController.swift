//
//  WTLoginViewController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/30.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  登陆控制器

import UIKit


class WTLoginViewController: UIViewController
{

    // MARK: - 拖线的属性
    @IBOutlet weak var loginHeaderImageV: UIImageView!
    /// 手机或邮箱
    @IBOutlet weak var phoneTextF: UITextField!
    /// 密码
    @IBOutlet weak var passwordTextF: UITextField!
    /// 注册按钮
    @IBOutlet weak var registerBtn: UIButton!
    /// 登陆按钮
    @IBOutlet weak var loginBtn: UIButton!
    
    // MARK: - 懒加载
    /// 手机或邮箱左侧的View
    lazy var phoneLeftView: UIImageView = {
        let phoneLeftView = UIImageView()
        phoneLeftView.image = UIImage(named: "ictab_me")
        phoneLeftView.frame = CGRect(x: 0, y: 0, width: 50, height: 45)
        phoneLeftView.contentMode = .Center
        return phoneLeftView
    }()
    
    /// 密码左侧的View
    lazy var passwordLeftView: UIImageView = {
        let passwordLeftView = UIImageView()
        passwordLeftView.image = UIImage(named: "pws_icon")
        passwordLeftView.frame = CGRect(x: 0, y: 0, width: 50, height: 45)
        passwordLeftView.contentMode = .Center
        return passwordLeftView
    }()
    
    // MARK: - 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置UI
        setupUI()
    }
}

// MARK: - 自定义函数
extension WTLoginViewController
{
    // MARK: 设置UI
    private func setupUI()
    {
        
        // 0、设置导航栏
        setupNav()
        
        // 1、手机或邮箱
        setupCommonTextField(phoneTextF, leftView: phoneLeftView)
        
        // 2、密码
        setupCommonTextField(passwordTextF, leftView: passwordLeftView)
        
        // 3、注册按钮
        self.registerBtn.layer.cornerRadius = 3
        self.registerBtn.layer.borderColor = WTColor(r: 231, g: 231, b: 231).CGColor
        self.registerBtn.layer.borderWidth = 1
        // 4、登陆按钮
        self.loginBtn.layer.cornerRadius = 3
    }
    
    // MARK: 设置导航栏
    private func setupNav()
    {
        title = "登录"

        // 关闭按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem.createCloseItem(self, action: #selector(closeBtnClick))
        
        // 忘记密码
        let forgetPasswordBtn = UIButton(type: .Custom)
        forgetPasswordBtn.titleLabel?.font = UIFont.setQIHeiFontWithSize(14)
        forgetPasswordBtn.setTitle("忘记密码", forState: .Normal)
        forgetPasswordBtn.addTarget(self, action: #selector(forgetPasswordBtnClick), forControlEvents: .TouchUpInside)
        forgetPasswordBtn.sizeToFit()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: forgetPasswordBtn)
    }
    
    // MARK: 设置textField公共属性
    private func setupCommonTextField(textField: UITextField, leftView: UIImageView)
    {
        textField.tintColor = WTMainColor
        textField.leftView = leftView
        textField.leftViewMode = .Always
    }
}

// MARK: - 事件
extension WTLoginViewController
{
    // MARK: 关闭按钮
    func closeBtnClick()
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: 忘记密码
    func forgetPasswordBtnClick()
    {
        
    }
    
    // MARK: 注册按钮
    @IBAction func registerBtnClick()
    {
        
    }
    
    // MARK: 登陆按钮
    @IBAction func loginBtnClick()
    {
        
    }
}

// MARK: - UITextFieldDelegate
extension WTLoginViewController: UITextFieldDelegate
{
    func textFieldDidBeginEditing(textField: UITextField)
    {
        if textField.tag == 1
        {
            self.phoneLeftView.image = UIImage(named: "ictab_me_selected")
        }
        else if textField.tag == 2
        {
            self.loginHeaderImageV.image = UIImage(named: "login_header_cover_eyes")
            self.passwordLeftView.image = UIImage(named: "pws_icon_hover")
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField)
    {
        if textField.tag == 1
        {
            self.phoneLeftView.image = UIImage(named: "ictab_me")
        }
        else if textField.tag == 2
        {
            self.loginHeaderImageV.image = UIImage(named: "login_header")
            self.passwordLeftView.image = UIImage(named: "pws_icon")
        }
    }
}
