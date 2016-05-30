//
//  WTLiveDetailViewController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/10.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  直播详情控制器

import UIKit


class WTLiveDetailViewController: UIViewController {

    // MARK: - 属性
    /// live数据模型
    var liveItem: WTLiveItem!
    /// liveDetail模型
    var liveDetailItem: WTLiveDetailItem!
    
    // MARK: 控件
    /// 竖屏播放器ContentView
    @IBOutlet weak var verticalPlayerContentView: UIView!
    /// 用户信息ContentView
    @IBOutlet weak var userInfoContentView: UIView!

    /// 竖屏播放器View
    //var liveDetailVerticalPlayerView = WTLiveDetailVerticalPlayerView.liveDetailVerticalPlayerView()
    
    var liveDetailVerticalPlayerVC = WTLiveDetailVerticalPlayerViewController()
    
    /// 用户信息View
    var liveDetailUserInfoView = WTLiveDetailUserInfoView.liveDetailUserInfoView()
    
    // MARK: 系统回调函数
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // 设置UI
        setupUI()
        
        // 加载数据
        loadData()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
        // 1、设置Frame
        liveDetailVerticalPlayerVC.view.frame = verticalPlayerContentView.bounds
        liveDetailUserInfoView.frame = userInfoContentView.bounds
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}

// MARK: - 自定义函数
extension WTLiveDetailViewController
{
    // MARK: 设置UI
    private func setupUI()
    {
        // 1、添加子控件
        verticalPlayerContentView.addSubview(liveDetailVerticalPlayerVC.view)
        userInfoContentView.addSubview(liveDetailUserInfoView)
        addChildViewController(liveDetailVerticalPlayerVC)
        
        
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
        NetworkTools.shareInstance.loadHomeLiveDetailData420(liveItem.room_id) { (result, error) in
            
            // 1.错误校验
            if error != nil
            {
                print(error)
                return
            }
            
            // 2、获取结果
            self.liveDetailItem = WTLiveDetailItem(dict: result!)
            
            // 3、更新UI
            // 获取直播播放的URL
            NetworkTools.shareInstance.getLivePlayerURL(self.liveDetailItem.schedule.cid, finished: { (result, error) in
                
                if error != nil
                {
                    WTLog("error:\(error)")
                    return 
                }
                
                self.liveDetailVerticalPlayerVC.url = NSURL(string: result!)
                //self.playerVC.url = NSURL(string: result!)
            })
            
            // 更新用户信息的View的数据
            self.liveDetailUserInfoView.liveDetailItem = self.liveDetailItem
        }
    }
}

