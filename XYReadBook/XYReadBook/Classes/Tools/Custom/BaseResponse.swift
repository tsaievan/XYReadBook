//
//  BaseResponse.swift
//  BookRead
//
//  Created by 童航 on 2017/6/20.
//  Copyright © 2017年 DZM. All rights reserved.
//

import UIKit
import ObjectMapper


/// 模型继承这个模型就可以不需要用任何转模型的框架,直接用点语法
class BaseResponse: NSObject,Mappable{

    func mapping(map: Map) {
        
    }
    
    required init?(map: Map) {
        super.init()
        mapping(map: map)
    }
    
    convenience init?(_ json: [String: Any]?) {
        if let json = json {
            let map = Map.init(mappingType: .fromJSON, JSON: json)
            self.init(map: map)
        } else {
            return nil
        }
    }
    
//    override var description: String {
//        return toJSONString(prettyPrint: true) ?? "nil"
//    }

}
