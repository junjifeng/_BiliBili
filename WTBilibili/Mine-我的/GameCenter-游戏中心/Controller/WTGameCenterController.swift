//
//  WTGameCenterController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/6/12.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  游戏中心控制器

import UIKit

private let gameCenterCell = "gameCenterCell"

class WTGameCenterController: UITableViewController {

    // MARK: - 属性
    /// 游戏中心模型
    private var gameCenterItems = [WTGameCenterItem]()
    
    // 系统回调函数
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // 设置UI
        setupUI()
        
        // 加载数据
        loadData()
    }
}

// MARK: - 自定义函数
extension WTGameCenterController
{
    // MARK: 设置UI
    private func setupUI()
    {
        title = "游戏中心"
        
        // 注册cell
        tableView.registerNib(UINib(nibName: "WTGameCenterCell", bundle: nil), forCellReuseIdentifier: gameCenterCell)
        // 行高
        tableView.rowHeight = 225;
        // 取消分隔线
        tableView.separatorStyle = .None
    }
    
    // MARK: 加载数据
    private func loadData()
    {
        // 加载游戏中心数据
        loadGameCenterData()
    }
}

// MARK: - 网络请求
extension WTGameCenterController
{
    // 加载游戏中心数据
    private func loadGameCenterData()
    {
        NetworkTools.shareInstance.loadGrameCenter { (result, error) in
            
            if error != nil
            {
                print("error\(error)")
                return
            }
            
            for itemDict in result!
            {
                self.gameCenterItems.append(WTGameCenterItem(dict: itemDict))
            }
            
            self.tableView.reloadData()
        }
    }
}

// MARK: - Table view data source
extension WTGameCenterController
{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return gameCenterItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(gameCenterCell) as! WTGameCenterCell
        cell.gameCenterItem = gameCenterItems[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        // 跳转至网页浏览器
        let webVC = WTWebViewController()
        webVC.url = gameCenterItems[indexPath.row].download_link
        navigationController?.pushViewController(webVC, animated: true)
    }

}

