//
//  WTMineViewController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/3.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

private let mineCellIdentifier = "mineCellIdentifier"

class WTMineViewController: UITableViewController {

    // MARK: - 控件
    /// tableView的headerView
    private lazy var headerView: WTMineHeaderView = {

        let headerView = WTMineHeaderView.headerView()
        headerView.delegate = self
        headerView.frame = CGRect(x: 0, y: 0, width: WTScreenWidth, height: 108)
        headerView.backgroundColor = self.tableView.backgroundColor
        return headerView
        
    }()
    
    // MARK: - 属性
    /// 数据源
    var mineItems = [[WTMineItem]]()
    
    // MARK: - 系统回调函数
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // 设置UI
        setupUI()
    }
}

// MARK: - 自定义函数
extension WTMineViewController
{
    // MARK: 设置UI
    private func setupUI()
    {
        unowned let weakSelf = self
        mineItems.append([WTMineItem(imageName: "mine_message", title: "消息", actionBlock: nil)])
        
        mineItems.append([WTMineItem(imageName: "mine_download", title: "离线缓存", actionBlock: nil)])
        
        mineItems.append(
                    [WTMineItem(imageName: "mine_history", title: "历史记录", actionBlock: nil),
                     WTMineItem(imageName: "mine_favourite", title: "我的收藏", actionBlock: nil),
                     WTMineItem(imageName: "mine_follow", title: "我的关注", actionBlock: nil),
                     WTMineItem(imageName: "mine_bill", title: "我的钱包", actionBlock: nil),
                     WTMineItem(imageName: "mine_game", title: "游戏中心", actionBlock: {
                        weakSelf.navigationController?.pushViewController(WTGameCenterController(), animated: true)
                     })
                    ]
                    )
        
        tableView.tableHeaderView = headerView
        tableView.rowHeight = 45
        tableView.sectionHeaderHeight = 10
        tableView.sectionFooterHeight = CGFloat.min
        tableView.reloadData()
    }

}

// MARK: - Table view data source and delegate
extension WTMineViewController
{
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return mineItems.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mineItems[section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(mineCellIdentifier) as! WTMineCell
        
        cell.mineItem = mineItems[indexPath.section][indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let mineItem = mineItems[indexPath.section][indexPath.row] as WTMineItem
        
        if let actionBlockTemp = mineItem.actionBlock
        {
            actionBlockTemp()
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

// MARK: - WTMineHeaderViewDelegate
extension WTMineViewController: WTMineHeaderViewDelegate
{
    // MARK: 注册
    func headerViewWithRegisterLabelDidClick()
    {
        let registerVC = UIStoryboard(name: "WTRegisterViewController", bundle: nil).instantiateInitialViewController()!
        presentViewController(WTNavigationController(rootViewController: registerVC), animated: true, completion: nil)
    }
    // MARK: 登陆
    func headerViewWithLoginLabelDidClick()
    {
        presentViewController(UINavigationController(rootViewController: WTLoginViewController()), animated: true, completion: nil)
    }
}
