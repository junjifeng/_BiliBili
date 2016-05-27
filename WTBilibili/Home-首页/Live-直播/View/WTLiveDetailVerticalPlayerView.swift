//
//  WTLiveVerticalPlayerView.swift
//  WTBilibili
//
//  Created by 耿杰 on 16/5/27.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  直播详情页面的横屏播放器

import UIKit

class WTLiveDetailVerticalPlayerView: UIView {
    
    // MARK: - 拖线的控件
    /// 占位View
    @IBOutlet weak var contentView: UIView!
    
    // MARK: - 属性
    /// 播放器
    var player: IJKMediaPlayback?

    /// 播放URL
    var url: NSURL?{
        didSet{

            // 1、创建播放器
            player = IJKFFMoviePlayerController(contentURL: url, withOptions: nil)
            
            guard let playerTemp = player else
            {
                return
            }
            
            self.contentView = playerTemp.view
            
            player?.prepareToPlay()
            
        }
    }
    
    // MARK: - 系统回调函数
    override func awakeFromNib() {
        
        // 添加通知
        setupNotification()
    }
    
    deinit{
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}

// MARK: - 自定义函数
extension WTLiveDetailVerticalPlayerView
{
    // MARK: 快速创建方法
    static func liveDetailVerticalPlayerView() -> WTLiveDetailVerticalPlayerView
    {
        return NSBundle.mainBundle().loadNibNamed("WTLiveDetailVerticalPlayerView", owner: nil, options: nil).last as! WTLiveDetailVerticalPlayerView
    }
    
    // MARK: 注册通知
    private func setupNotification()
    {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(loadStateDidChange(_:)), name: IJKMPMoviePlayerLoadStateDidChangeNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(moviePlayBackFinish(_:)), name: IJKMPMoviePlayerPlaybackDidFinishNotification, object: nil)
    
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(mediaIsPreparedToPlayDidChange(_:)), name: IJKMPMediaPlaybackIsPreparedToPlayDidChangeNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(moviePlayBackStateDidChange(_:)), name: IJKMPMoviePlayerPlaybackStateDidChangeNotification, object: nil)
    }
}

// MARK: - 事件
extension WTLiveDetailVerticalPlayerView
{
    @objc private func loadStateDidChange(noti: NSNotification)
    {
        let loadState = player?.loadState
        
        if loadState!.contains(IJKMPMovieLoadState.PlaythroughOK)
        {
            WTLog("LoadStateDidChange: IJKMovieLoadStatePlayThroughOK: \(loadState)")
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

    @objc private func moviePlayBackStateDidChange(noti: NSNotification)
    {
//        guard let playerTemp = player else
//        {
//            return
//        }
        
//        let backRate = playerTemp.playbackRate as! IJKMPMoviePlaybackState
//        switch backRate {
//        case IJKMPMoviePlaybackState.Stopped:
//            
//            WTLog("IJKMPMoviePlayBackStateDidChange \(playerTemp.playbackState): stoped");
//        }
    }
}
