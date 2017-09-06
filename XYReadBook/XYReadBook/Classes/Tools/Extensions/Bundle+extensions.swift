//
//  Bundle+extensions.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/9/1.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit


// MARK: - Bundle的分类
extension Bundle {
    var namespace: String { ///< 命名空间
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
