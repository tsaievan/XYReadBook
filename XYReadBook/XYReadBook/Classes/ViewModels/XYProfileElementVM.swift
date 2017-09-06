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
        var arrayM = [[XYElement]]()
        guard let path = Bundle.main.path(forResource: "XYProfileCellInfo.json", ofType: nil),
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
    
    class func settingElements()->[[XYElement]]? {
        var arrayM = [[XYElement]]()
        guard let path = Bundle.main.path(forResource: "XYSettingCellInfo.json", ofType: nil),
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
