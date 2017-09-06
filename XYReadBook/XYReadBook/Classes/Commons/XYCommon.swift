//
//  XYCommon.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/9/6.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit

///< 获取屏幕宽度
let gScreenWidth: CGFloat = UIScreen.main.bounds.width

///< 获取屏幕高度
let gScreenHeight: CGFloat = UIScreen.main.bounds.height

///< 获取屏幕分辨率
let gScale: CGFloat = UIScreen.main.scale


///< 自定义打印
func XYLog<T>(message: T, file: String = #file, funcName: String = #function, lineNum: Int = #line) {
    #if DEBUG
    let fileName = (file as NSString).lastPathComponent
    print("\(fileName) : (\(lineNum)) - \(message)")
    #endif
}


