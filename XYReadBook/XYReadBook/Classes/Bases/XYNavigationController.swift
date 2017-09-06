//
//  XYNavigationController.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/9/1.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit

class XYNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = UIColor.hm_color(withHex:0x68C9F9)
        
    }
    
    ///< 重写pushViewController方法, 在push的时候, 会先判断自控制器的数目, 如果大于0, 当push的时候, 会隐藏tabBar
    ///< 同时, 不会出现程序刚刚加载进来的时候, 就隐藏tabBar
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
