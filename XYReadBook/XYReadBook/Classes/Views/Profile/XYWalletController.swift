//
//  XYWalletController.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/9/3.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit

class XYWalletController: XYViewController {
    lazy var contentView = UIScrollView(frame: CGRect(x: 0, y: 64, width: gScreenWidth, height: gScreenHeight))
    lazy var walletView = XYWalletView(frame: CGRect(x: 0, y: 0, width: gScreenWidth, height: 650))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        contentView.contentSize = CGSize(width: view.bounds.width, height: 650)
        contentView.showsVerticalScrollIndicator = false
        contentView.showsHorizontalScrollIndicator = false
        contentView.addSubview(walletView)
        view.addSubview(contentView)
    }
}
