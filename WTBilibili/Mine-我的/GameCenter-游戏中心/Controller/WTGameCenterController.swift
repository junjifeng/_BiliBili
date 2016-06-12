//
//  WTGameCenterController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/6/12.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  游戏中心控制器

import UIKit

class WTGameCenterController: UITableViewController {

    // MARK: - 属性
    /// 游戏中心模型
    private var gameCenterItems = [WTGameCenterItem]()
    
    // 系统回调函数
    override func viewDidLoad()
    {
        super.viewDidLoad()

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
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
