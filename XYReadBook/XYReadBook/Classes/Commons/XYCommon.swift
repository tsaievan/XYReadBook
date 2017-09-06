//
//  XYCommon.swift
//  XYReadBook
//
//  Created by fox on 2017/9/4.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit
/*
 刀哥的那个获取屏幕宽高,有点太恶心了.还得方法调用
 */

/// 屏幕宽度
let ScreenWidth:CGFloat = UIScreen.main.bounds.size.width

/// 屏幕高度
let ScreenHeight:CGFloat = UIScreen.main.bounds.size.height

/// 屏幕分辨率
let Scale:CGFloat = UIScreen.main.scale


func XYLog<T>(messsage : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
   
    #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        
        print("\(fileName):(\(lineNum))-\(messsage)")
        
    #endif
}

