//
//  WTLiveViewController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/3.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  首页->直播控制器

import UIKit

private let WTEntranceCellID = "WTEntranceCellID"

private let WTLivePartitionCellID = "WTLivePartitionCell"

class WTLiveViewController: UITableViewController
{
    
    // MARK: 属性
    private var partitionItems = [WTPartitionsItem]()
    
    // MARK: 控件
    /// headerView
    private var headerView = WTLiveHeaderView()
    
    // MARK: 系统回调函数
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // 1、设置UI
        setupUI()
        
        // 2、加载数据
        loadData()
        
        // 3、注册通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(liveListDidClick(_:)), name: WTLiveListDidClickNotification, object: nil)
    }
}

// MARK: - 自定义函数
extension WTLiveViewController
{
    // MARK: 设置UI
    private func setupUI()
    {
        // 0、tableView基本属性
        tableView.registerNib(UINib(nibName: "WTEntranceCell", bundle: nil), forCellReuseIdentifier: WTEntranceCellID)
        tableView.registerNib(UINib(nibName: "WTLivePartitionCell", bundle: nil), forCellReuseIdentifier: WTLivePartitionCellID)
        tableView.rowHeight = 425
        tableView.separatorStyle = .None
        
        // 1、设置tableView的headerView
        headerView.frame = CGRect(x: 0, y: 0, width: WTScreenWidth, height: 280)
        headerView.delegate = self
        tableView.tableHeaderView = headerView
        
    }
    
    // MARK: 加载数据
    private func loadData()
    {
        // 1、加载headerView的数据
        loadAllData()
    }
}

// MARK: - 网络请求
extension WTLiveViewController
{
    // MARK: 加载headerView的数据
    private func loadAllData()
    {
        NetworkTools.shareInstance.loadHomeLiveData { (result, error) in
            // 1.错误校验
            if error != nil
            {
                print(error)
                return
            }
            
            // 2、广告
            if let bannerArray = result!["banner"] as? [[String: AnyObject]]
            {
                // 2.获取结果
                var bannerItems = [WTBannerItem]()
                for banner in bannerArray
                {
                    bannerItems.append(WTBannerItem(dict: banner))
                }
                
                // 3、刷新数据
                self.headerView.bannerItems = bannerItems
            }
            
            // 3、按钮组
            if let entranceIconArray = result!["entranceIcons"] as? [[String: AnyObject]]
            {
                // 2.获取结果
                var entranceIconsItems = [WTEntranceIconsItem]()
                
                for entranceIcon in entranceIconArray
                {
                    entranceIconsItems.append(WTEntranceIconsItem(dict: entranceIcon))
                }
                // 3、刷新数据
                self.headerView.entranceIconsItems = entranceIconsItems
            }
        
            // 5、tableViewCell
            if let partitionArray = result!["partitions"] as? [[String: AnyObject]]
            {
                // 2、获取结果
                for partition in partitionArray
                {
                    self.partitionItems.append(WTPartitionsItem(dict: partition))
                }
                
                // 3、刷新表格
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: - 事件处理
extension WTLiveViewController
{
    @objc private func liveListDidClick(noti: NSNotification)
    {
//        print("noti:\(noti)")
        let liveDetailVC = UIStoryboard(name: "WTLiveDetailViewController", bundle: nil).instantiateInitialViewController() as! WTLiveDetailViewController
        liveDetailVC.liveItem = noti.userInfo!["liveItem"] as! WTLiveItem;
        self.navigationController?.pushViewController(liveDetailVC, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension WTLiveViewController
{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (partitionItems.count ?? 0) + 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if indexPath.row == 0
        {
            let cell = tableView.dequeueReusableCellWithIdentifier(WTEntranceCellID) as! WTEntranceCell
        
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCellWithIdentifier(WTLivePartitionCellID) as! WTLivePartitionCell
            
            cell.partitionsItem = partitionItems[indexPath.row]
            
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if indexPath.row == 0
        {
            return 58
        }
        else
        {
            return 387
        }
    }
}

// MARK: - WTLiveHeaderViewDelegate
extension WTLiveViewController: WTLiveHeaderViewDelegate
{
    func headerView(headerView: WTLiveHeaderView, value: String)
    {
        if value.matchesAllNumber()   // 数字,打开视频页面
        {
            print("数字")
        }
        else                          // http请求,打开webView
        {
            print("url")
        }
    }
}
