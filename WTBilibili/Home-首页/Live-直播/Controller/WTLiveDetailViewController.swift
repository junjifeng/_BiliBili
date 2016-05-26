//
//  WTLiveDetailViewController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/10.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit
import Ji

class WTLiveDetailViewController: UIViewController {

    // MARK: 控件
    @IBOutlet weak var userInfoContentView: UIView!
    
    var liveDetailUserInfoView = WTLiveDetailUserInfoView.liveDetailUserInfoView()
    
    // MARK: - live数据源模型
    var liveItem: WTLiveItem!
    
    var liveDetailItem: WTLiveDetailItem!
    
    /// 播放地址
    var playerUrl: String!
    
    // MARK: 系统回调函数
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // 设置UI
        setupUI()
        
        // 加载数据
        loadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        liveDetailUserInfoView.frame = userInfoContentView.bounds
    }
}

// MARK: - 自定义函数
extension WTLiveDetailViewController
{
    // 设置UI
    private func setupUI()
    {
        // 1、添加子控件
        userInfoContentView.addSubview(liveDetailUserInfoView)
    }
    
    // MARK: 加载数据
    private func loadData()
    {
        // 加载直播详情信息
        loadLiveDetailData()
    }
}

// MARK: - 网络请求
extension WTLiveDetailViewController
{
    // MARK: 加载直播详情信息
    private func loadLiveDetailData()
    {
        NetworkTools.shareInstance.loadHomeLiveDetailData(liveItem.room_id) { (result, error) in
            
            // 1.错误校验
            if error != nil
            {
                print(error)
                return
            }
            
            // 2、获取结果
            self.liveDetailItem = WTLiveDetailItem(dict: result!)
            
            // 3、更新UI
            self.liveDetailUserInfoView.liveDetailItem = self.liveDetailItem
            
            // 4、获取直播的URL
            self.getLivePlayerUrl()
        }
    }
    
    // 获取直播的URL
    private func getLivePlayerUrl()
    {
        let videoXML = Ji(xmlURL: NSURL(string: "http://live.bilibili.com/api/playurl?player=1&quality=0&cid=\(self.liveDetailItem.schedule.cid)")!)
        playerUrl = videoXML?.xPath("//video//durl//url")?.first!.content
    }
}

// MARK: - 事件
extension WTLiveDetailViewController
{
    // MARK: 插放按钮事件
    @IBAction func playBtnClick(sender: UIButton)
    {
        let playerVC = WTPlayerViewController()
        playerVC.url = NSURL(string: playerUrl)
        presentViewController(playerVC, animated: true, completion: nil)
    }
}
