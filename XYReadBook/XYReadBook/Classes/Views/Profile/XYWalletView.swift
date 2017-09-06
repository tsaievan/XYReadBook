//
//  XYWalletView.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/9/4.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit

class TopView: UIView {
    lazy var coinImageView = UIImageView()
    lazy var totalLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TopView {
    fileprivate func setupUI() {
        coinImageView = UIImageView(image: (#imageLiteral(resourceName: "coin")))
        addSubview(coinImageView)
        
        totalLabel.text = "总资产\r\n(100金币)"
        totalLabel.textColor = .darkGray
        if #available(iOS 8.2, *) {
            totalLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFontWeightBold)
        } else {
            totalLabel.font = UIFont.systemFont(ofSize: 19)
        }
        totalLabel.sizeToFit()
        totalLabel.numberOfLines = 0
        totalLabel.textAlignment = .left
        addSubview(totalLabel)
    }
}

extension TopView {
    fileprivate func makeConstraints() {
        coinImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.centerX.equalTo(self).offset(-50)
        }
        
        totalLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.coinImageView)
            make.left.equalTo(self.coinImageView.snp.right).offset(16)
        }
    }
}

class MiddleView: UIView {
    lazy var topLine = UIView()
    lazy var bottomLine = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MiddleView {
    fileprivate func setupUI() {
        let array = ["10元(1000金币)", "20元(2000金币)", "50元(5000金币)", "100元(10000金币)", "300元(30000金币)", "0.01元(1金币)"]
        
        ///< 计算button的frame值
        let leftMargin: CGFloat = 24
        let topMargin: CGFloat = 16
        let width = (gScreenWidth - (CGFloat)(3.0 * leftMargin)) * 0.5
        for i in 0 ..< 6 {
            let chargeButton = UIButton(type: .custom)
            chargeButton.setBackgroundImage((#imageLiteral(resourceName: "focusButton")), for: .normal)
            chargeButton.setBackgroundImage((#imageLiteral(resourceName: "focusButton_selected")), for: .selected)
            let title = array[i]
            chargeButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            chargeButton.setTitle(title, for: .normal)
            chargeButton.setTitleColor(.lightGray, for: .normal)
            chargeButton.setTitleColor(.green, for: .selected)
            let x = leftMargin + (CGFloat)(i % 2) * (width + leftMargin)
            let y: CGFloat = topMargin + (CGFloat)(i / 2) * 44
            chargeButton.frame = CGRect(x: x, y: y, width: width, height: 36)
            addSubview(chargeButton)
        }
        
        topLine.backgroundColor = .lightGray
        addSubview(topLine)
        
        bottomLine.backgroundColor = .lightGray
        addSubview(bottomLine)
    }
}

extension MiddleView {
    fileprivate func makeConstraints() {
        topLine.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(1)
        }
        
        bottomLine.snp.makeConstraints { (make) in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(1)
        }
    }
}

class PayView: UIView {
    lazy var topLine = UIView()
    lazy var bottomLine = UIView()
    lazy var middleLine = UIView()
    lazy var wechatImageView = UIImageView()
    lazy var alipayImageView = UIImageView()
    lazy var weichatLabel = UILabel()
    lazy var alipayLabel = UILabel()
    lazy var wechatButton = UIButton(type: .custom)
    lazy var alipayButton = UIButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PayView {
    fileprivate func setupUI() {
        topLine.backgroundColor = .lightGray
        addSubview(topLine)
        
        bottomLine.backgroundColor = .lightGray
        addSubview(bottomLine)
        
        middleLine.backgroundColor = .lightGray
        addSubview(middleLine)
        
        wechatImageView.image = (#imageLiteral(resourceName: "wechatIcon"))
        addSubview(wechatImageView)
        
        alipayImageView.image = (#imageLiteral(resourceName: "alipayIcon"))
        addSubview(alipayImageView)
        
        weichatLabel.text = "微信支付"
        weichatLabel.textColor = .darkGray
        weichatLabel.textAlignment = .center
        weichatLabel.font = UIFont.systemFont(ofSize: 17)
        addSubview(weichatLabel)
        
        alipayLabel.text = "支付宝支付"
        alipayLabel.textColor = .darkGray
        alipayLabel.textAlignment = .center
        alipayLabel.font = UIFont.systemFont(ofSize: 17)
        addSubview(alipayLabel)
        
        wechatButton.setBackgroundImage((#imageLiteral(resourceName: "payPick")), for: .normal)
        wechatButton.setBackgroundImage((#imageLiteral(resourceName: "payPick_selected")), for: .selected)
        addSubview(wechatButton)
        
        alipayButton.setBackgroundImage((#imageLiteral(resourceName: "payPick")), for: .normal)
        alipayButton.setBackgroundImage((#imageLiteral(resourceName: "payPick_selected")), for: .selected)
        addSubview(alipayButton)
    }
}

extension PayView {
    fileprivate func makeConstraints() {
        topLine.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(1)
        }
        
        bottomLine.snp.makeConstraints { (make) in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(1)
        }
        
        middleLine.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            make.width.equalTo(gScreenWidth - 16 * 2)
            make.height.equalTo(1)
        }
        
        wechatImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(8)
            make.left.equalTo(self).offset(24)
        }
        
        alipayImageView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self).offset(-8)
            make.left.equalTo(self).offset(24)
        }
        
        weichatLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.wechatImageView)
            make.left.equalTo(self.wechatImageView.snp.right).offset(10)
        }
        
        alipayLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.alipayImageView)
            make.left.equalTo(self.alipayImageView.snp.right).offset(10)
        }
        
        wechatButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.wechatImageView)
            make.right.equalTo(self).offset(-24)
        }
        
        alipayButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.alipayImageView)
            make.right.equalTo(self).offset(-24)
        }
    }
}


class BottomView: UIView {
    lazy var payLabel = UILabel()
    lazy var payView = PayView(frame: CGRect())
    lazy var priceLabel = UILabel()
    lazy var payNowButton = UIButton(type: .custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BottomView {
    fileprivate func setupUI() {
        payLabel.textAlignment = .center
        payLabel.text = "支付方式"
        if #available(iOS 8.2, *) {
            payLabel.font = UIFont.systemFont(ofSize: 19, weight: UIFontWeightBold)
        } else {
            payLabel.font = UIFont.systemFont(ofSize: 19)
        }
        payLabel.textColor = .darkGray
        payLabel.sizeToFit()
        addSubview(payLabel)
        
        payView.backgroundColor = .white
        addSubview(payView)
        
        priceLabel.textColor = .red
        priceLabel.sizeToFit()
        priceLabel.font = UIFont.systemFont(ofSize: 13)
        priceLabel.text = "需要支付: 10元"
        priceLabel.textAlignment = .center
        addSubview(priceLabel)
        
        payNowButton.setBackgroundImage((#imageLiteral(resourceName: "focusButton_highlighted")), for: .normal)
        payNowButton.setTitle("立即支付", for: .normal)
        payNowButton.setTitleColor(UIColor.hm_color(withHex: 0xFAA200), for: .normal)
        payNowButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        addSubview(payNowButton)
    }
}

extension BottomView {
    fileprivate func makeConstraints() {
        payLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(20)
        }
        
        payView.snp.makeConstraints { (make) in
            make.top.equalTo(self.payLabel.snp.bottom).offset(6)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(110)
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-24)
            make.top.equalTo(self.payView.snp.bottom).offset(10)
        }
        
        payNowButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.priceLabel)
            make.top.equalTo(self.priceLabel.snp.bottom).offset(16)
        }
    }
}

class XYWalletView: UIView {
    lazy var topView = TopView(frame: CGRect())
    lazy var middleView = MiddleView(frame: CGRect())
    lazy var bottomView = BottomView(frame: CGRect())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension XYWalletView {
    fileprivate func setupUI() {
        topView.backgroundColor = UIColor.hm_color(withHex: 0xF1F1F1)
        addSubview(topView)
        
        middleView.backgroundColor = .white
        addSubview(middleView)
        
        bottomView.backgroundColor = UIColor.hm_color(withHex: 0xF1F1F1)
        addSubview(bottomView)
    }
}

extension XYWalletView {
    fileprivate func makeConstraints() {
        topView.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(160)
        }
        
        middleView.snp.makeConstraints { (make) in
            make.top.equalTo(self.topView.snp.bottom)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.height.equalTo(160)
        }
        
        bottomView.snp.makeConstraints { (make) in
            make.top.equalTo(self.middleView.snp.bottom)
            make.left.equalTo(self)
            make.right.equalTo(self)
            make.bottom.equalTo(self)
        }
    }
}
