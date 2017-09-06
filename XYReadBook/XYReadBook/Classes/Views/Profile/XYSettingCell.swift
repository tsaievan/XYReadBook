//
//  XYSettingCell.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/9/4.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit

class XYSettingCell: XYBasicCell {
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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .value2, reuseIdentifier: reuseIdentifier)
        label.snp.remakeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
