 //
//  WTLiveDetailVerticalPlayerViewController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/29.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

class WTLiveDetailVerticalPlayerViewController: UIViewController {

    // MARK: - 属性
    /// 播放器
    var player: IJKMediaPlayback?
    
    var timer: NSTimer?
    
    // MARK: - 控件
    /// 工具栏占位的View
    @IBOutlet weak var touchView: UIView!
    /// liveLogoImageView
    @IBOutlet weak var liveLogoImageV: UIImageView!
    /// 在加载中展示的View
    @IBOutlet weak var playBeforeView: UIView!
    /// 播放的View
    @IBOutlet weak var contentView: UIView!
    
    /// 竖屏播放器工具栏
    var playerControlPanelV2 = WTPlayerControlPanelV2.playerControlPanelV2()
    
    var url: NSURL?{
        didSet{
            
            guard let urlTemp = url else
            {
                return
            }
            
            player = IJKFFMoviePlayerController(contentURL: urlTemp, withOptions: nil)
            
            let playerView = player?.view
            playerView!.frame = view.bounds

            contentView.addSubview(playerView!)
            player?.scalingMode = IJKMPMovieScalingMode.AspectFit
            
            if self.player?.isPlaying() == false
            {
                self.player?.prepareToPlay()
            }
        }
    }
    
    // MARK: 系统回调函数
    override func viewDidLoad()
    {
        super.viewDidLoad()

        installMovieNotificationObservers()
        
        setupUI()
        
        // 2、开启定时器
        startTimer()
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
        playerControlPanelV2.frame = self.view.bounds
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if playerControlPanelV2.hidden == true
        {
            // 1、开启定时，过3秒隐藏工具栏
            startTimer()
        }
        else
        {
            // 1、停止定时器
            stopTimer()
        }
    }
    
    deinit{
        
        player?.shutdown()
        
        stopTimer()
    }
}

// MARK: - 自定义函数
extension WTLiveDetailVerticalPlayerViewController
{
    private func setupUI()
    {
        // 1、添加子控件 
        touchView.addSubview(playerControlPanelV2)
        
    }
    
    private func installMovieNotificationObservers()
    {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(loadStateDidChange(_:)), name: IJKMPMoviePlayerLoadStateDidChangeNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(moviePlayBackFinish(_:)), name: IJKMPMoviePlayerPlaybackDidFinishNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(mediaIsPreparedToPlayDidChange(_:)), name: IJKMPMediaPlaybackIsPreparedToPlayDidChangeNotification, object: nil)
    }
    
    // MARK: 重启定时器
    func restartTimer()
    {
        stopTimer()
        startTimer()
    }
    
    // MARK: 开启定时器
    private func startTimer()
    {
        // 1、开启定时，过3秒隐藏工具栏
        timer = NSTimer(timeInterval: 3, target: self, selector: #selector(hiddenPlayerControlPanelV2), userInfo:  nil, repeats: false)
        
        NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
        
        // 2、显示工具栏
        if playerControlPanelV2.hidden == true
        {
            
            UIView.animateWithDuration(0.5) {
                
                self.playerControlPanelV2.hidden = false
            }
        }
    }
    
    // MARK: 关闭定时器
    private func stopTimer()
    {
        timer!.invalidate()
        timer = nil
        
        // 2、隐藏工具栏
        hiddenPlayerControlPanelV2()
    }
}

// MARK: - 事件
extension WTLiveDetailVerticalPlayerViewController
{
    @objc private func loadStateDidChange(noti: NSNotification)
    {
        let loadState = player?.loadState
        
        if loadState!.contains(IJKMPMovieLoadState.PlaythroughOK)
        {
            WTLog("LoadStateDidChange: IJKMovieLoadStatePlayThroughOK: \(loadState)")
            playBeforeView.hidden = true
        }
        else if loadState!.contains(IJKMPMovieLoadState.Stalled)
        {
            WTLog("LoadStateDidChange: IJKMPMovieLoadState: \(loadState)")
        }
        else
        {
            WTLog("LoadStateDidChange: ??? :\(loadState)")
        }
    }
    
    @objc private func moviePlayBackFinish(noti: NSNotification)
    {
        let reason = noti.userInfo![IJKMPMoviePlayerPlaybackDidFinishReasonUserInfoKey] as! IJKMPMovieFinishReason
        
        switch reason {
        case IJKMPMovieFinishReason.PlaybackEnded:
            
            WTLog("playbackStateDidChange: IJKMPMovieFinishReasonPlaybackEnded: \(reason)\n")
            
        case IJKMPMovieFinishReason.UserExited:
            
            WTLog("playbackStateDidChange: IJKMPMovieFinishReasonUserExited: \(reason)\n");
            
        case IJKMPMovieFinishReason.PlaybackError:
            
            WTLog("playbackStateDidChange: IJKMPMovieFinishReasonPlaybackError: \(reason)\n");
            
        }
    }
    
    @objc private func mediaIsPreparedToPlayDidChange(noti: NSNotification)
    {
        WTLog("mediaIsPrepareToPlayDidChange\n");
    }
    
    
    // MARK: 隐藏palyerControlPanelV2的View
    func hiddenPlayerControlPanelV2()
    {
        UIView.animateWithDuration(0.5) {
            
            self.playerControlPanelV2.hidden = true
            
        }
    }
}

