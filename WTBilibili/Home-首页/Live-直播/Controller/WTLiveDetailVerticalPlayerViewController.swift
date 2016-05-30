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
    
    @IBOutlet weak var playBeforeView: UIView!
    @IBOutlet weak var contentView: UIView!
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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        installMovieNotificationObservers()
    }
    
    deinit{
        player?.shutdown()
    }
    /*
     - (void)loadStateDidChange:(NSNotification*)notification {
     IJKMPMovieLoadState loadState = _player.loadState;
     
     if ((loadState & IJKMPMovieLoadStatePlaythroughOK) != 0) {
     NSLog(@"LoadStateDidChange: IJKMovieLoadStatePlayThroughOK: %d\n",(int)loadState);
     }else if ((loadState & IJKMPMovieLoadStateStalled) != 0) {
     NSLog(@"loadStateDidChange: IJKMPMovieLoadStateStalled: %d\n", (int)loadState);
     } else {
     NSLog(@"loadStateDidChange: ???: %d\n", (int)loadState);
     }
     }
    */
}

// MARK: - 自定义函数
extension WTLiveDetailVerticalPlayerViewController
{
    private func installMovieNotificationObservers()
    {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(loadStateDidChange(_:)), name: IJKMPMoviePlayerLoadStateDidChangeNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(moviePlayBackFinish(_:)), name: IJKMPMoviePlayerPlaybackDidFinishNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(mediaIsPreparedToPlayDidChange(_:)), name: IJKMPMediaPlaybackIsPreparedToPlayDidChangeNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(moviePlayBackStateDidChange(_:)), name: IJKMPMoviePlayerPlaybackStateDidChangeNotification, object: nil)
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
