//
//  UIImage-Extension.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/9.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

extension UIImage
{
    /**
     生成带边框的圆形图片
     
     - parameter borderW: 边框宽度
     - parameter color:   边框颜色
     
     - returns: 新的图片对象
     */
    public func getImageWithBorder(borderW: CGFloat, color: UIColor) -> UIImage
    {
        let imageSize = CGSizeMake(self.size.width + 2 * borderW, self.size.height + 2 * borderW)
        
        // 1、开启上下文 
        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
        
        // 2、绘制一个大圆
        var path = UIBezierPath(ovalInRect: CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height))
        
        color.set()
        
        // 3、填充 
        path.fill()
        
        // 4、设置裁剪路径 
        path = UIBezierPath(ovalInRect: CGRect(x: borderW, y: borderW, width: self.size.width, height: self.size.height))
        
        // 5、裁剪 
        path.addClip()
        
        // 6、把圆绘制到上下文中
        self.drawInRect(CGRect(x: borderW, y: borderW, width: self.size.width, height: self.size.height))
        
        // 7、获取新的图片
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        // 8、关闭上下文 
        UIGraphicsEndImageContext()
        
        // 9、返回新的图片
        return newImage
    }
}