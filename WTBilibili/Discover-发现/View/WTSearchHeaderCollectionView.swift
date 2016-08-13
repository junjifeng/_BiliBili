//
//  WTSearchHeaderCollectionView.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/7/5.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

private let SearchHeaderCell = "SearchHeaderCell"

class WTSearchHeaderCollectionView: UICollectionView
{
    private var titles = [String]()
    
    
}

extension WTSearchHeaderCollectionView: UICollectionViewDataSource
{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(SearchHeaderCell, forIndexPath: indexPath) as! WTSearchHeaderCell
        
        cell.titleLabel.text = "极限挑战"
        
        return cell
        
    }
}
