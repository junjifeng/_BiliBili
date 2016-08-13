//
//  WTDiscoverViewController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/3.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  发现控制器

import UIKit

/// 搜索框作动画的时间
private let searchTextFAnimateDuration: NSTimeInterval = 1

/// 搜索框X的值
private let searchTextFX = 49

/// 扫一扫的高度
private let scanBtnH = 28

private var DiscoverHeaderViewH: CGFloat = 236

private let DiscoverCellIdentifier = "DiscoverCellIdentifier"

class WTDiscoverViewController: WTBaseViewController {

    // MARK: - 控件 
    /// 扫一扫Button
    private let scanBtn = UIButton()
    /// 搜索框
    private let searchTextF = UITextField()
    /// 取消按钮
    private let cancelBtn = UIButton()
    
    /// tipLabel
    private let tipLabel = WTLabel()
    /// 关键词CollectionView
    private let searchHeaderCollectionView = UIView()
    /// tableView
    private let tableView = UITableView(frame: CGRectZero, style: .Grouped)
    /// 查看更多
    private let seeMoreView = WTSeeMoreView.seeMoreView()
    
    /// 记录scrollView的contentOff的Y值
    var endY: CGFloat = 0
    
    /// 数据源
    private var userCenterItemArray = [[WTUserCenterItem]]()
    
    //private var collectionView = WTSearchHeaderCollectionView()
    
    // MARK: - 系统回调函数
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // 设置View
        setupView()
        
        // 设置数据
        setupData()
    }
}

// MARK: - 自定义函数
extension WTDiscoverViewController
{
    // MARK: - 设置View
    private func setupView()
    {
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        headerView.frame.size.height = DiscoverHeaderViewH
        
        // 1、添加子控件
        headerView.addSubview(scanBtn)
        headerView.addSubview(searchTextF)
        headerView.addSubview(cancelBtn)
        headerView.addSubview(tipLabel)
        headerView.addSubview(searchHeaderCollectionView)
        headerView.addSubview(seeMoreView)
        footerView.addSubview(tableView)
        
        // 2、布局子控件
        footerView.frame = CGRect(x: 0, y: DiscoverHeaderViewH, width: WTScreenWidth, height: WTScreenHeight - DiscoverHeaderViewH - WTTabBarHeight)
        
        // 2.1、扫一扫
        let scanBtnY = 25
        let scanBtnW = 26
        
        scanBtn.frame = CGRect(x: 13, y: scanBtnY, width: scanBtnW, height: scanBtnH)
        
        // 2.2、搜索框
        let searchTextFRightMarign = 10
        let searchTextFW = Int(WTScreenWidth) - searchTextFX - searchTextFRightMarign
        searchTextF.frame = CGRect(x: searchTextFX, y: scanBtnY, width: searchTextFW, height: scanBtnH)
        
        // 2.3、取消按钮
        let cancelBtnW = 50
        let cancelBtnX = Int(WTScreenWidth) - 50
        cancelBtn.frame = CGRect(x: cancelBtnX, y: 25, width: cancelBtnW, height: 30)
        
        // 2.4、tipLabel
        tipLabel.frame = CGRect(x: 12, y: 72, width: 70, height: 17)
        
        // 、关键词CollectionView
        let searchHeaderCollectionViewX:CGFloat = 12
        let searchHeaderCollectionViewW = WTScreenWidth - searchHeaderCollectionViewX * 2
        searchHeaderCollectionView.frame = CGRect(x: searchHeaderCollectionViewX, y: 94.5, width: searchHeaderCollectionViewW, height: 85.5)
        
//        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
//        collectionView.backgroundColor = UIColor.greenColor()
//        collectionView.snp_makeConstraints { (make) in
//            make.left.equalTo(12)
//            make.right.equalTo(-12)
//            make.top.equalTo(94.5)
//            make.height.equalTo(190.5)
//        }
        
        // 查看更多View
        seeMoreView.snp_makeConstraints { (make) in
            make.bottom.equalTo(-24)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.height.equalTo(14)
        }
        
        tableView.frame = footerView.bounds
        
        // 3、设置子控件属性
        // 3.1、扫一扫
        scanBtn.setBackgroundImage(UIImage(named: "scanning_icon"), forState: .Normal)
        
        // 3.2、搜索框
        searchTextF.delegate = self
        searchTextF.borderStyle = UITextBorderStyle.RoundedRect
        searchTextF.font = UIFont.systemFontOfSize(14)
        searchTextF.placeholder = "搜索视频、番剧、up主或AV号"
        // 设置LeftView
        let leftView = UIView()
        leftView.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        let leftImageV = UIImageView()
        leftImageV.image = UIImage(named: "misc_search")
        leftView.addSubview(leftImageV)
        leftImageV.frame = CGRect(x: 9, y: 4.5, width: 19, height: 19)
        searchTextF.leftView = leftView
        searchTextF.leftViewMode = .Always
        
        // 3.3、取消按钮
        cancelBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        cancelBtn.setTitle("取消", forState: .Normal)
        cancelBtn.titleLabel?.textColor = UIColor.whiteColor()
        cancelBtn.addTarget(self, action: #selector(cancelBtnClick), forControlEvents: .TouchUpInside)
        
        // 3.4、tipLabel
        tipLabel.text = "大家都在搜"
        tipLabel.textColor = UIColor.whiteColor()
        tipLabel.setFontSize(14)
        
        seeMoreView.delegate = self
        
        tableView.rowHeight = 50
        tableView.backgroundColor = WTColor(r: 244, g: 244, b: 244)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(WTDiscoverCell.self, forCellReuseIdentifier: DiscoverCellIdentifier)
        
    
    }
    
    // MARK: - 设置数据
    private func setupData()
    {
        userCenterItemArray.append([WTUserCenterItem(imageName: "discovery_circle_ico", title: "兴趣圈", actionBlock: nil)])
    
        userCenterItemArray.append([WTUserCenterItem(imageName: "discovery_rankOriginal_ico", title: "原创排行榜", actionBlock: nil),
                                   WTUserCenterItem(imageName: "discovery_rankAll_ico", title: "全区排行榜", actionBlock: nil)
            ])
        
        userCenterItemArray.append([WTUserCenterItem(imageName: "discovery_game_ico", title: "游戏中心", actionBlock: nil)])
        
        tableView.reloadData()
    }
}

// MARK: - 事件
extension WTDiscoverViewController
{
    // MARK: 取消按钮
    func cancelBtnClick()
    {

        searchTextF.frame.origin.x = CGFloat(searchTextFX)
        searchTextF.frame.size.height = CGFloat(scanBtnH)
        headerView.frame.size.height = DiscoverHeaderViewH
        
        searchTextF.endEditing(true)
    }
}

// MARK: - UITextFieldDelegate
extension WTDiscoverViewController: UITextFieldDelegate
{
    func textFieldDidBeginEditing(textField: UITextField)
    {
        UIView.animateWithDuration(searchTextFAnimateDuration) {
            
            self.searchTextF.frame.origin.x = 10
            self.searchTextF.frame.size.height = 30
            self.headerView.frame.size.height = 64
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension WTDiscoverViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return userCenterItemArray[section].count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return userCenterItemArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(DiscoverCellIdentifier) as! WTDiscoverCell
        
        let userCenterItem = userCenterItemArray[indexPath.section][indexPath.row]
        
        cell.imageView?.image = UIImage(named: userCenterItem.imageName)
        
        cell.textLabel?.text = userCenterItem.title
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return CGFloat.min
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 9
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y < 0
        {
            UIView.animateWithDuration(0.1, animations: {
                
                self.endY += (-scrollView.contentOffset.y) * 0.3
                self.footerView.frame.origin.y = DiscoverHeaderViewH + self.endY
            })
            
            scrollView.contentOffset = CGPoint(x: 0, y: 0)
        }
//        WTLog("footerVIew:\(footerView.frame)")
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        UIView.animateWithDuration(0.3) {
            
            self.footerView.frame.origin.y = DiscoverHeaderViewH
            self.endY = 0
        }
    }
}

// MARK: - WTSeeMoreViewDelegate
extension WTDiscoverViewController: WTSeeMoreViewDelegate
{
    func seeMoreViewDidClick()
    {
        if DiscoverHeaderViewH == 236
        {
            DiscoverHeaderViewH = 341
            
        }
        else
        {
            DiscoverHeaderViewH = 236
        }
        headerView.frame.size.height = DiscoverHeaderViewH
        footerView.frame.origin.y = DiscoverHeaderViewH
        
    }
}