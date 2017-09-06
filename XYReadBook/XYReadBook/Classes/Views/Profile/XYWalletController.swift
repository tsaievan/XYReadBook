//
//  XYWalletController.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/9/3.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit

class XYWalletController: XYViewController {
    lazy var contentView = UIScrollView(frame: CGRect(x: 0, y: 64, width: UIScreen.hm_screenWidth(), height: UIScreen.hm_screenHeight()))
    lazy var walletView = XYWalletView(frame: CGRect(x: 0, y: 0, width: UIScreen.hm_screenWidth(), height: 650))
    
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
