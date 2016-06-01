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
    private lazy var headerView: WTMineHeaderView = {

        let headerView = WTMineHeaderView.headerView()
        headerView.delegate = self
        headerView.frame = CGRect(x: 0, y: 0, width: WTScreenWidth, height: 108)
        headerView.backgroundColor = self.tableView.backgroundColor
        return headerView
        
    }()
    
    // MARK: - 属性
    /// 数据源
    var datas = [[WTMineItem]]()
    
    // MARK: - 系统回调函数
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupUI()
    }
}

// MARK: - 自定义函数
extension WTMineViewController
{
    // MARK: 设置UI
    private func setupUI()
    {
        datas.append([WTMineItem(imageName: "mine_message", title: "消息")])
        
        datas.append([WTMineItem(imageName: "mine_download", title: "离线缓存")])
        
        datas.append(
                    [WTMineItem(imageName: "mine_history", title: "历史记录"),
                     WTMineItem(imageName: "mine_favourite", title: "我的收藏"),
                     WTMineItem(imageName: "mine_follow", title: "我的关注"),
                     WTMineItem(imageName: "mine_bill", title: "我的钱包"),
                     WTMineItem(imageName: "mine_game", title: "游戏中心")
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
        return datas.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return datas[section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(mineCellIdentifier) as! WTMineCell
        
        cell.mineItem = datas[indexPath.section][indexPath.row]
        
        return cell
    }
}

// MARK: - WTMineHeaderViewDelegate
extension WTMineViewController: WTMineHeaderViewDelegate
{
    func headerViewWithRegisterLabelDidClick()
    {
        
    }
    
    func headerViewWithLoginLabelDidClick()
    {
        presentViewController(UINavigationController(rootViewController: WTLoginViewController()), animated: true, completion: nil)
    }
}
