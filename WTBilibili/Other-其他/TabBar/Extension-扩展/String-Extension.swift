//
//  String-Extension.swift
//  WTBilibili
//
//  Created by 耿杰 on 16/5/4.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import Foundation

extension String
{
    // MARK: - 正则验证
    // MARK: 自己写正则表达式验证
    public func matchesRegex(regex: String, options: NSRegularExpressionOptions) -> Bool
    {
        do {
            let pattern = try NSRegularExpression(pattern: regex, options: .CaseInsensitive)
            return pattern.numberOfMatchesInString(self, options: NSMatchingOptions.Anchored, range: NSRange(location: 0, length: self.characters.count)) > 0
        }
        catch{
            print("error\(error)")
            return false
        }
    }
    
    // MARK: 是否全是数字
    public func matchesAllNumber() -> Bool
    {
        return matchesRegex("^\\d*$", options: .CaseInsensitive)
    }
}