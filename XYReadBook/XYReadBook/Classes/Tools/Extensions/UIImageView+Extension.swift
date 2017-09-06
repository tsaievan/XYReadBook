//
//  UIImageView+Extension.swift
//  BookRead
//
//  Created by fox on 2017/6/5.
//  Copyright © 2017年 DZM. All rights reserved.
//

import Foundation
import YYWebImage
extension UIImageView {
    convenience init (imageName:String) {
        self.init()
        self.image = UIImage(named:imageName)
    }
    
    func setImageView(urlString:String,placeHolder:String? = nil){
        
        let imageUrl = NSURL.init(string: urlString)
        if let placeHolder = placeHolder {
            
            self.yy_setImage(with: imageUrl! as URL, placeholder: UIImage.init(named: placeHolder))
        } else {
            self.yy_setImage(with: imageUrl! as URL, options: YYWebImageOptions(rawValue: 0))
        }
    }
}


/// MARK 扩大按钮响应范围
/// 设置此属性即可扩大响应范围, 分别对应上左下右
 private var ExtendEdgeInsetsKey: Void?
extension UIButton {
   
    var extendEdgeInsets: UIEdgeInsets {
        get {
            return objc_getAssociatedObject(self, &ExtendEdgeInsetsKey) as? UIEdgeInsets ?? UIEdgeInsets.zero
        }
        set {
            objc_setAssociatedObject(self, &ExtendEdgeInsetsKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if UIEdgeInsetsEqualToEdgeInsets(extendEdgeInsets, .zero) || !self.isEnabled || self.isHidden || self.alpha < 0.01 {
            return super.point(inside: point, with: event)
        }
        let newRect = extendRect(bounds, extendEdgeInsets)
        return newRect.contains(point)
    }
    
    private func extendRect(_ rect: CGRect, _ edgeInsets: UIEdgeInsets) -> CGRect {
        let x = rect.minX - edgeInsets.left
        let y = rect.minY - edgeInsets.top
        let w = rect.width + edgeInsets.left + edgeInsets.right
        let h = rect.height + edgeInsets.top + edgeInsets.bottom
        return CGRect(x: x, y: y, width: w, height: h)
    }
}
