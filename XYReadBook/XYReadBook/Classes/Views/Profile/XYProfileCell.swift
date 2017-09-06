//
//  XYProfileCell.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/9/4.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit

class XYProfileCell: XYBasicCell {
    var accView: UIView?
    var accViewName: String? {
        didSet {
            guard let cls = NSClassFromString(model?.accessViewName ?? "") as? UIView.Type else {
                return
            }
            accView = cls.init()
            if let accView = accView {
                (accView as? UIImageView)?.image = (#imageLiteral(resourceName: "enter"))
                addSubview(accView)
                accView.snp.makeConstraints{ (make) in
                    make.centerY.equalTo(self)
                    make.right.equalTo(self).offset(-16)
                }
            }
        }
    }
}
