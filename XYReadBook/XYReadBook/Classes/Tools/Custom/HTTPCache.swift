//
//  HTTPCache.swift
//  BookRead
//
//  Created by fox on 2017/6/20.
//  Copyright © 2017年 DZM. All rights reserved.
//

import UIKit
import ObjectMapper
class HTTPCache: CacheManager {
    
    static func store<T: Mappable>(_ obj: T?, forKey key: String) {
        
        if let jsonString = obj?.toJSONString() {
            CacheManager.xwj_setObject(object: jsonString as NSCoding, forKey: key)
        }
    }
    
    static func objectModel<T: Mappable>(jsonString: String) -> T? {
        //  string -> data -> json -> map -> response
        
            let jsonData = jsonString.data(using: .utf8)
            let jsonObj = try? JSONSerialization.jsonObject(with: jsonData!, options: [])
            let json = jsonObj as? [String: Any]
        
            let map = Map.init(mappingType: .fromJSON, JSON: json!)
            let response = T.init(map: map)
             return response
        }

    
    
    static func object<T: Mappable>(class: T.Type, forKey key: String) -> T? {
        //  string -> data -> json -> map -> response
       if let jsonString = CacheManager.xwj_objectForKey(forkey: key) as? String,
            let jsonData  = jsonString.data(using: .utf8),
            let jsonObj = try? JSONSerialization.jsonObject(with: jsonData, options: []),
            let json = jsonObj as? [String: Any] {
            let map = Map.init(mappingType: .fromJSON, JSON: json)
            let response = T.init(map: map)
            return response
        } else {
            return nil
        }
    }
    
    
    
       
}

