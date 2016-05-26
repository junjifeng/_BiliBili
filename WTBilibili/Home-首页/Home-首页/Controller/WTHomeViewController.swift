//
//  WTHomeViewController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/3.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  首页控制器

import UIKit

class WTHomeViewController: UIViewController
{
    // MARK: 自定义控件
    /// 标题工具栏
    let toolBarView = UIView()
    /// 内容的ScrollView
    let contentView = UIScrollView()
    /// 选中的标题按钮
    var selectedBtn = UIButton()
    /// 标题按钮数组
    var titleBtns = [UIButton]()

    // MARK: - 系统回调函数
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // 1、设置UI
        setupUI()
        
        // 2、设置所有子控制器
        setupAllChildViewControllers()
        
        // 3、设置标题
        setupAllTitle()
    }
}

// MARK: - 自定义函数
extension WTHomeViewController
{
    // MARK: 设置UI
    private func setupUI()
    {
        // 1、添加标题工具栏
        toolBarView.frame = self.navigationController!.navigationBar.bounds
        navigationController?.navigationBar.addSubview(toolBarView)
        
        // 2、设置内容滚动视图
        view.addSubview(contentView)
        let y: CGFloat = self.navigationController!.navigationBarHidden ? 20 : 64
        contentView.frame = CGRect(x: 0, y: y, width: WTScreenWidth, height: WTScreenHeight)
        contentView.delegate = self
        contentView.pagingEnabled = true
        contentView.bounces = false
        
        automaticallyAdjustsScrollViewInsets = false
    }
    
    // MARK: - 设置所有子控制器
    private func setupAllChildViewControllers()
    {
        // 1、直播
        setupOneChildViewController(WTLiveViewController(), title: "直播")
        // 2、推荐
        setupOneChildViewController(WTRecommendViewController(), title: "推荐")
        // 3、番剧
        setupOneChildViewController(WTSomeDramaViewController(), title: "番剧")
        // 4、分类
        setupOneChildViewController(WTCategoryViewController(), title: "分区")
    }
    
    // MARK: - 设置一个子控制器
    private func setupOneChildViewController(viewController: UIViewController, title: String)
    {
        viewController.title = title
        addChildViewController(viewController)
    }
    
    // MARK: - 设置标题
    private func setupAllTitle()
    {
        let count = childViewControllers.count
        
        var x: CGFloat = 0
        let y: CGFloat = 0
        let w: CGFloat = 80
        let h = toolBarView.bounds.height
        for i in 0..<count
        {
            x = CGFloat(i) * w;
            let viewController = childViewControllers[i]
            
            // 1、创建按钮
            let btn = UIButton(type: .Custom)
            
            btn.frame = CGRect(x: x, y: y, width: w, height: h)
            toolBarView.addSubview(btn)
            
            // 2、设置按钮属性
            btn.tag = i
            btn.setTitle(viewController.title, forState: .Normal)
            btn.setTitleColor(WTHomeTitleBtnNormalColor, forState: .Normal)
            btn.setTitleColor(WTHomeTitleBtnSelectedColor, forState: .Highlighted)
            btn.addTarget(self, action: #selector(titleBtnClick), forControlEvents: .TouchUpInside)
            
//            if i == 1
//            {
//                titleBtnClick(btn)
//            }
            
            titleBtns.append(btn)
        }
        
        let btn = titleBtns[1];
        titleBtnClick(btn)
        
        contentView.contentSize = CGSize(width: CGFloat(count) * WTScreenWidth, height: WTScreenHeight)
    }
}

// MARK: - 自定义函数
extension WTHomeViewController
{
    // MARK: 根据索引设置控制器的View
    private func setupOneViewControllerView(currentIndex: Int)
    {
        // 1、获取子控制器
        let viewController = childViewControllers[currentIndex]
    
        // 2、判断view已经加入到contentView
        if viewController.view.superview != nil
        {
            return;
        }
        
        // 3、设置frame
        viewController.view.frame = contentView.bounds
        
        // 4、添加view
        contentView.addSubview(viewController.view)
    }
    
    // MARK: 更改左右两边按钮属性
    private func changeButtonAttr(offset: CGFloat)
    {
        let leftIndex = Int(offset / WTScreenWidth)
        
        let btn = titleBtns[leftIndex];
        titleBtnClick(btn)
    }
}

// MARK: - 事件处理
extension WTHomeViewController
{
    // MARK: 标题按钮点击
    @objc private func titleBtnClick(btn: UIButton)
    {
        print("titleBtnClick")
        
        // 1、设置按钮颜色
        selectedBtn.setTitleColor(WTHomeTitleBtnNormalColor, forState: .Normal)
        btn.setTitleColor(WTHomeTitleBtnSelectedColor, forState: .Normal)
        
        // 2、设置ScrollView的contentOffset的Y值
//        let x = CGFloat(btn.tag) * WTScreenWidth
//        contentView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
        
        setupOneViewControllerView(btn.tag)
        
        // 3、赋值当前选中的按钮
        selectedBtn = btn
    }
}

// MARK: - UIScrollViewDelegate
extension WTHomeViewController: UIScrollViewDelegate
{
    // MARK: 手指滑动时调用
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        // 更改左右两边按钮属性
        changeButtonAttr(scrollView.contentOffset.x)
    }
    
    // MARK: 减速完成后调用
    func scrollViewDidEndDecelerating(scrollView: UIScrollView)
    {
        
        scrollViewDidEndScrollingAnimation(scrollView)
    }
    
    // MARK: 当滚动视图完成后，调用该方法，如果没有动画，就不会调用
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView)
    {
        let currentIndex = Int(scrollView.contentOffset.x / WTScreenWidth)
        
        let selectedBtn = titleBtns[currentIndex]
        
        titleBtnClick(selectedBtn)
        
        setupOneViewControllerView(currentIndex)
    }
}
