//
//  WTUserCenterViewController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/7/3.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

private let userCenterCellIdentifier = "userCenterCellIdentifier"

private let headerViewH: CGFloat = 150

class WTUserCenterViewController: UIViewController {

    /// 顶部的View
    private var footerView = UIView()
    /// 底部的View
    private var headerView = WTNotLoginView.notLoginView()

    private var tableView = UITableView()
    
    /// 数据源
    var userCenterItemArray = [[WTUserCenterItem]]()
    var titles = [String]()
    
    /// 记录scrollView的contentOff的Y值
    var endY: CGFloat = 0
    
    // MARK: - 系统回调函数
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // 设置View
        setupView()
        
        // 设置数据
        setupData()
    }
}

// MARK: - 自定义函数
extension WTUserCenterViewController
{
    // MARK: 设置View
    private func setupView()
    {
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        
        // 1、未登录的页面
        view.addSubview(headerView)
        headerView.frame = CGRect(x: 0, y: 0, width: WTScreenWidth, height: WTScreenHeight - WTTabBarHeight)
        headerView.delegate = self
        
        // 2、底部的View
        view.addSubview(footerView)
        footerView.backgroundColor = UIColor.clearColor()
        footerView.frame = CGRect(x: 0, y: headerViewH, width: WTScreenWidth, height: WTScreenHeight - headerViewH)
        
        // 2.1、个人中心、我的消息的tableView
        footerView.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: 0, width: WTScreenWidth, height: WTScreenHeight - headerViewH - WTTabBarHeight + 10)
        
        tableView.rowHeight = 234
        tableView.layer.cornerRadius = 5
        tableView.separatorStyle = .None
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = WTColor(r: 244, g: 244, b: 244)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(UINib(nibName: "WTUserCenterCell", bundle: nil), forCellReuseIdentifier: userCenterCellIdentifier)
    }
    
    // MARK: 设置数据
    private func setupData()
    {
        unowned let weakSelf = self
        
        // 1、生成tableView的数据
        userCenterItemArray.append([
                        WTUserCenterItem(imageName: "mine_download", title: "离线缓存", actionBlock: {
                            
                        }),
                        WTUserCenterItem(imageName: "mine_history", title: "历史记录", actionBlock: nil),
                        WTUserCenterItem(imageName: "mine_favourite", title: "我的收藏", actionBlock: nil),
                        WTUserCenterItem(imageName: "mine_follow", title: "我的关注", actionBlock: nil),
                        WTUserCenterItem(imageName: "mine_pocketcenter", title: "我的钱包", actionBlock: nil),
                        WTUserCenterItem(imageName: "mine_gamecenter", title: "游戏中心", actionBlock: {
                            
                            weakSelf.navigationController?.pushViewController(WTGameCenterController(), animated: true)
                        }),
                        WTUserCenterItem(imageName: "mine_theme", title: "主题选择", actionBlock: nil)
            ])
        
        userCenterItemArray.append([
            WTUserCenterItem(imageName: "mine_answerMessage", title: "回复我的", actionBlock: nil),
            WTUserCenterItem(imageName: "mine_shakeMe", title: "@我", actionBlock: nil),
            WTUserCenterItem(imageName: "mine_gotPrise", title: "收到的赞", actionBlock: nil),
            WTUserCenterItem(imageName: "mine_privateMessage", title: "私信", actionBlock: nil),
            WTUserCenterItem(imageName: "mine_systemNotification", title: "系统通知", actionBlock: nil)
            ])
        
        titles.append("个人中心")
        titles.append("我的消息")
    
        // 2、刷新表格
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension WTUserCenterViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return titles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(userCenterCellIdentifier) as! WTUserCenterCell

        cell.userCenterItems = userCenterItemArray[indexPath.row]
        cell.title = titles[indexPath.row]
        
        return cell
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y < 0
        {
            UIView.animateWithDuration(0.1, animations: {
                
                self.endY += (-scrollView.contentOffset.y) * 0.3
                self.footerView.frame.origin.y = headerViewH + self.endY
            })
            
            scrollView.contentOffset = CGPoint(x: 0, y: 0)
        }
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        UIView.animateWithDuration(0.3) {
            
            self.footerView.frame.origin.y = headerViewH
            self.endY = 0
        }
    }
}

// MARK: - WTNotLoginViewDelegate
extension WTUserCenterViewController: WTNotLoginViewDelegate
{
    // MARK: 注册
    func notLoginViewDidClickWithRegisterBtn()
    {
        let registerVC = UIStoryboard(name: "WTRegisterViewController", bundle: nil).instantiateInitialViewController()!
        presentViewController(WTNavigationController(rootViewController: registerVC), animated: true, completion: nil)
    }
    
    // MARK: 登录
    func notLoginViewDidClickWithLoginBtn()
    {
        presentViewController(UINavigationController(rootViewController: WTLoginViewController()), animated: true, completion: nil)
    }
}