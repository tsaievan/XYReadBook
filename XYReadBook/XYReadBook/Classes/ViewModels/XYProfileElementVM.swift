//
//  XYProfileElementVM.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/9/4.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit

class XYProfileElementVM {
    class func profileElements()->[[XYElement]]? {
        return element(resouce: "XYProfileCellInfo.json")
    }
    
    class func settingElements()->[[XYElement]]? {
        return element(resouce: "XYSettingCellInfo.json")
    }
    
    class func resourceElements()->[[XYElement]]? {
        return element(resouce: "XYResourceCellInfo.json")
    }
}

extension XYProfileElementVM {
    fileprivate class func element(resouce: String)->[[XYElement]]? {
        var arrayM = [[XYElement]]()
        guard let path = Bundle.main.path(forResource: resouce, ofType: nil),
            let data =  NSData(contentsOfFile: path) as Data?,
            let info = try? JSONSerialization.jsonObject(with: data, options: []) as? [Any] else {
                return nil
        }
        if let info = info {
            for element in  info{
                guard let array = NSArray.yy_modelArray(with: XYElement.self, json: element) as? [XYElement] else {
                    return nil
                }
                arrayM.append(array)
            }
        }
        return arrayM
    }
}
