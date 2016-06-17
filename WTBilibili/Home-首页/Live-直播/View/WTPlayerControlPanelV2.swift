//
//  WTPlayerControlPanelV2.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/6/16.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  竖屏播放视频的工具栏View

import UIKit

// MARK: - 协议
protocol WTPlayerControlPanelV2Delegate: NSObjectProtocol {
    
    func playerControlPanelV2DidClickWithBackBtn()
    
    func playerControlPanelV2DidClickWithShareBtn()
    
    func playerControlPanelV2(playerControlPanelV2: WTPlayerControlPanelV2, didClickWithPlayOrPauseBtn playOrPauseBtn: UIButton)
    
    func playerControlPanelV2DidClickWithRotateBtn()
}

class WTPlayerControlPanelV2: UIView
{
    // MARK: 属性
    weak var delegate: WTPlayerControlPanelV2Delegate?
    
    // MARK: 控件
    /// 播放暂停按钮
    @IBOutlet weak var playOrPauseBtn: UIButton!
    @IBOutlet weak var playOrPuaseBottomBtn: UIButton!
}

// MARK: - 自定义函数
extension WTPlayerControlPanelV2
{
    static func playerControlPanelV2() -> WTPlayerControlPanelV2
    {
        return NSBundle.mainBundle().loadNibNamed("WTPlayerControlPanelV2", owner: nil, options: nil).last as! WTPlayerControlPanelV2
    }
}

// MARK: - 事件
extension WTPlayerControlPanelV2
{
    // MARK: 返回
    @IBAction func backBtnClick()
    {
        delegate?.playerControlPanelV2DidClickWithBackBtn()
    }

    // MARK: 分享
    @IBAction func shareBtnClick()
    {
        delegate?.playerControlPanelV2DidClickWithShareBtn()
    }

    // MARK: 播放或暂停
    @IBAction func playOrPauseBtnClick()
    {
        delegate?.playerControlPanelV2(self, didClickWithPlayOrPauseBtn: playOrPauseBtn)
        
        playOrPauseBtn.selected = !playOrPauseBtn.selected
        playOrPuaseBottomBtn.selected = !playOrPuaseBottomBtn.selected
    }
    
    // MARK: 旋转按钮
    @IBAction func rotateBtnClick()
    {
        delegate?.playerControlPanelV2DidClickWithRotateBtn()
    }
}
