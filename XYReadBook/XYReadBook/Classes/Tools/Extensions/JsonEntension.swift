//
//  JsonEntension.swift
//  BookRead
//
//  Created by fox on 2017/6/20.
//  Copyright © 2017年 DZM. All rights reserved.
//

import UIKit
import SwiftyJSON
protocol JSONConvertible {
    func toJSON() -> JSON
}

extension Array: JSONConvertible {
    func toJSON() -> JSON {
        return JSON.init(self)
    }
}

extension Dictionary: JSONConvertible {
    func toJSON() -> JSON {
        return JSON.init(self)
    }
}


