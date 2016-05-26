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
    /// 视频icon
    @IBOutlet weak var coverImageV: UIImageView!
    /// 标题
    @IBOutlet weak var titleLabel: UILabel!
    /// 名字
    @IBOutlet weak var nameLabel: UILabel!
    /// 头像
    @IBOutlet weak var faceImageV: UIImageView!
    /// 头像背景的View
    @IBOutlet weak var faceBgView: UIView!
    /// 在线人数
    @IBOutlet weak var onlineLabel: UILabel!
    /// 关注操作按钮
    @IBOutlet weak var followOperationBtn: UIButton!
    
    // MARK: - live数据源模型
    var liveItem: WTLiveItem!
    
    var liveDetailItem: WTLiveDetailItem!
    
    var playerUrl: String!
    
    // MARK: 系统回调函数
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // 设置UI
        setupUI()
        
        // 设置UI数据
        setupUIData()
        
        // 加载数据
        loadData()
    }
}

// MARK: - 自定义函数
extension WTLiveDetailViewController
{
    // 设置UI
    private func setupUI()
    {
        // 1、添加圆角
        followOperationBtn.layer.cornerRadius = followOperationBtn.frame.size.height * 0.5
        
    }
    
    // MARK: 设置UI数据
    private func setupUIData()
    {
        titleLabel.text = liveItem.title
        
        nameLabel.text = liveItem.owner.name
        
        faceImageV.sd_setImageWithURL(liveItem.owner.face)
        
        onlineLabel.text = "\(liveItem.online)"
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
            
            // 3、刷新头像
            self.coverImageV.sd_setImageWithURL(self.liveDetailItem.cover)
            
            // 获取直播的URL
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
