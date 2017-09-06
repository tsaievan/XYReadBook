//
//  XWJCacheManager.swift
//  BookRead
//
//  Created by fox on 2017/6/15.
//  Copyright © 2017年 DZM. All rights reserved.
//

import UIKit
import YYCache

/*
 鼓励多用YYCache
 */
class CacheManager {
     let cache = YYCache.init(name:"XYReadBook")
    static let shared = CacheManager()
    public static func  xwj_objectForKey(forkey: String) -> NSCoding?{
      return CacheManager.shared.cache?.object(forKey: forkey)
    }
    
    public static func xwj_setObject(object:NSCoding,forKey:String) {
         CacheManager.shared.cache?.setObject(object as  NSCoding?, forKey: forKey)
    }
    
    
    public static func xwj_removeObject(forKey:String) {
        
        CacheManager.shared.cache?.removeObject(forKey: forKey)
    }
    
    
    public static func xwj_containsObject(forKey:String) -> Bool{
        
          let  iscache = CacheManager.shared.cache?.containsObject(forKey: forKey)
            
         return iscache!
    }
}
