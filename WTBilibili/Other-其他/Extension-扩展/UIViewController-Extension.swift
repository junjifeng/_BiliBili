//
//  UIViewController-Extension.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/11.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//

import UIKit

extension UIViewController
{
    public override class func initialize(){
        struct Static{
            static var token: dispatch_once_t = 0
        }
        
        if self != UIViewController.self{
            return
        }
        
//        dispatch_once(&Static.token){
//            let originalSelector = Selector("viewWillAppear:")
//            let swizzledSelector = Selector("nsh_viewWillAppear:")
//            
//            let originalMethod = class_getInstanceMethod(self, originalSelector)
//            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
//            
//            let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
//            
//            if didAddMethod {
//                class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
//            } else {
//                method_exchangeImplementations(originalMethod, swizzledMethod);
//            }
//        }
    }
}
