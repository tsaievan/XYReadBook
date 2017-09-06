//
//  XYTabBar.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/9/1.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit

class XYTabBar: UITabBar {
    
    lazy var tabBarButtons = [UIView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let count = items?.count else {
            return
        }
        let w: CGFloat = self.hm_width / CGFloat(count)
        let h = self.hm_height
        var index: Int = 0
        
        for v in subviews {
            guard let cls = NSClassFromString("UITabBarButton") else {
                return
            }
            if v.isKind(of: cls) {
                let x = CGFloat(index) * w
                v.frame = CGRect(x: x, y: 5, width: w, height: h)
                if tabBarButtons.count < 3 {
                    tabBarButtons.append(v)
                    items?[index].tag = index
                }
                index += 1
            }
        }
    }
}



