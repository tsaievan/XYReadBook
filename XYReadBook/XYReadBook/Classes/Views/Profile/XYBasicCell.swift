//
//  XYBasicCell.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/9/4.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit

class XYBasicCell: UITableViewCell {
    
    var imgView = UIImageView()
    var label = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        makeConstraints()
        separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: XYElement? {
        didSet {
            imgView.image = UIImage(named: model?.img ?? "")
            label.text = model?.title ?? ""
        }
    }
}

extension XYBasicCell {
    func setupUI() {
        imgView.contentMode = .center
        imgView.layer.cornerRadius = 5
        imgView.layer.masksToBounds = true
        addSubview(imgView)
        
        label.sizeToFit()
        label.textColor = .darkGray
        label.textAlignment = .center
        addSubview(label)
    }
}

extension XYBasicCell {
    func makeConstraints() {
        imgView.snp.makeConstraints { (make) in
            make.width.equalTo(35)
            make.height.equalTo(35)
            make.top.equalTo(self).offset(8)
            make.left.equalTo(self).offset(20)
        }
        
        label.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.imgView)
            make.left.equalTo(imgView.snp.right).offset(16)
        }
    }
}
