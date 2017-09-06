//
//  XYAboutUsController.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/9/3.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit

class XYAboutUsController: XYViewController {

    lazy var commonView = XYProfileCommonView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), labelHidden: false)
    override func viewDidLoad() {
        super.viewDidLoad()
        commonView = XYProfileCommonView(frame: view.bounds, labelHidden: false)
        view.addSubview(commonView)
    }
}





