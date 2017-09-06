//
//  XYProfileCommonView.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/9/3.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit

class XYProfileCommonView: UIView {
    var islabelHidden: Bool = false
    
    lazy var iconImageView = UIImageView()
    
    lazy var shadowView = UIView()
    
    lazy var versionLabel = UILabel()
    
    lazy var focusButton = UIButton(type: .custom)

    init(frame: CGRect, labelHidden: Bool) {
        super.init(frame: frame)
        islabelHidden = labelHidden
        setupUI()
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

// MARK: - 设置UI
extension XYProfileCommonView {
    fileprivate func setupUI() {
        iconImageView.image = (#imageLiteral(resourceName: "iTunesArtwork"))
        iconImageView.layer.cornerRadius = 10
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.shadowColor = UIColor.darkGray.cgColor
        iconImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        iconImageView.layer.shadowOpacity = 0.5
        iconImageView.layer.shadowRadius = 10
        addSubview(iconImageView)
        
        let appName = Bundle.main.infoDictionary!["CFBundleDisplayName"] as? String ?? ""
        let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String ?? ""
        let txtStr = "\(appName)\r\nversion : \(version)"
        versionLabel.text = txtStr
        versionLabel.numberOfLines = 0
        versionLabel.textColor = UIColor.darkGray
        versionLabel.textAlignment = .center
        versionLabel.sizeToFit()
        versionLabel.isHidden = islabelHidden
        addSubview(versionLabel)
        
        shadowView.backgroundColor = UIColor.white
        shadowView.layer.shadowColor = UIColor.darkGray.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowView.layer.shadowRadius = 10
        shadowView.layer.shadowOpacity = 1
        insertSubview(shadowView, belowSubview: iconImageView)
        
        focusButton.setTitle("立即关注", for: .normal)
        focusButton.setTitleColor(.darkGray, for: .normal)
        focusButton.setBackgroundImage((#imageLiteral(resourceName: "focusButton")), for: .normal)
        focusButton.sizeToFit()
        focusButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        focusButton.isHidden = !islabelHidden
        addSubview(focusButton)
        
    }
}

// MARK: - 设置约束
extension XYProfileCommonView {
    fileprivate func makeConstraints() {
        iconImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(-40)
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        
        shadowView.snp.makeConstraints { (make) in
            make.center.equalTo(self.iconImageView)
            make.width.equalTo(self.iconImageView).offset(-5)
            make.height.equalTo(self.iconImageView).offset(-5)
        }
        
        versionLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.iconImageView)
            make.top.equalTo(self.iconImageView.snp.bottom).offset(16)
        }
        
        focusButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.iconImageView)
            make.top.equalTo(self.iconImageView.snp.bottom).offset(50)
        }
    }
}
