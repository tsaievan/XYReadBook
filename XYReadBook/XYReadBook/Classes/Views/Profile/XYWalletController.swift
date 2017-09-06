//
//  XYWalletController.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/9/3.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit

class XYWalletController: XYViewController {
    fileprivate lazy var contentView = UIScrollView(frame: CGRect(x: 0, y: 64, width: gScreenWidth, height: gScreenHeight))
    fileprivate lazy var walletView = XYWalletView(frame: CGRect(x: 0, y: 0, width: gScreenWidth, height: 650))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension XYWalletController {
    fileprivate func setupUI() {
        automaticallyAdjustsScrollViewInsets = false
        contentView.contentSize = CGSize(width: view.bounds.width, height: 650)
        contentView.showsVerticalScrollIndicator = false
        contentView.showsHorizontalScrollIndicator = false
        contentView.addSubview(walletView)
        view.addSubview(contentView)
        walletView.delegate = self
    }
}


// MARK: - XYWalletView 代理方法回调
extension XYWalletController: XYWalletViewDelegate {
    func walletView(walletView: XYWalletView, payViewButtonSelected sender: UIButton) {
        sender.isSelected = !sender.isSelected
        switch sender.tag {
        case XYPayViewButton.wechatButton.rawValue:
            print("点击了微信按钮")
        default:
            print("点击了支付宝按钮")
        }
    }
}
