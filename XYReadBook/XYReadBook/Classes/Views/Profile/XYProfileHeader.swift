//
//  XYProfileHeader.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/9/1.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit
import SnapKit

class XYProfileHeader: UIView {
    
    /// 用户名Label
    lazy var userNameLabel = UILabel()
    
    /// 用户头像
    lazy var iconBtn = UIButton(type: .custom)
    
    /// 点击切换提示Label
    lazy var tipLabel = UILabel()
    
    /// 签到Button
    lazy var signinBtn = UIButton(type: .custom)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        makeConstrains()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - 设置UI
extension XYProfileHeader {
    fileprivate func setupUI() {
        ///< 设置用户名Label
        userNameLabel.text = "欣阅读书"
        userNameLabel.textColor = UIColor.darkGray
        userNameLabel.textAlignment = .center
        userNameLabel.sizeToFit()
        addSubview(userNameLabel)
        
        ///< 设置头像
        iconBtn.setBackgroundImage((#imageLiteral(resourceName: "iTunesArtwork")), for: .normal)
        iconBtn.layer.masksToBounds = true
        iconBtn.layer.cornerRadius = 50
        addSubview(iconBtn)
        
        ///< 设置点击切换提示Label
        tipLabel.text = "点击切换"
        tipLabel.textColor = UIColor.darkGray
        tipLabel.font = UIFont.systemFont(ofSize: 14)
        tipLabel.textAlignment = .center
        tipLabel.sizeToFit()
        addSubview(tipLabel)
        
        ///< 设置签到Button
        signinBtn.setBackgroundImage((#imageLiteral(resourceName: "signin")), for: .normal)
        signinBtn.setTitle("签到", for: .normal)
        signinBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        signinBtn.setTitleColor(UIColor.hm_color(withHex: 0xFAA200), for: .normal)
        addSubview(signinBtn)
    }
}

// MARK: - 更新约束
extension XYProfileHeader {
    fileprivate func makeConstrains() {
        ///< 用户名Label约束
        userNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(16)
            make.centerX.equalTo(self)
        }
        
        ///< 头像约束
        iconBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(userNameLabel.snp.bottom).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        ///< 点击切换提示Label约束
        tipLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(iconBtn.snp.bottom).offset(10)
        }
        
        ///< 签到Button约束
        signinBtn.snp.makeConstraints { (make) in
            make.top.equalTo(userNameLabel)
            make.right.equalTo(self).offset(-16)
        }
    }
}
