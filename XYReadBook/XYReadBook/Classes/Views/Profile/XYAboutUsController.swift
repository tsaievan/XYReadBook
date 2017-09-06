//
//  XYAboutUsController.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/9/3.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit

class XYAboutUsController: XYViewController {

    lazy var commonView = XYProfileCommonView(frame: CGRect(), labelHidden: false)
    override func viewDidLoad() {
        super.viewDidLoad()
        commonView = XYProfileCommonView(frame: view.bounds, labelHidden: false)
        view.addSubview(commonView)
    }
}





