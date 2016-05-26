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

extension String
{
    public func md5() ->String!{
        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
        let strLen = CUnsignedInt(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        result.destroy()
        return String(format: hash as String)
    }
}