//
//  XYOpinionController.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/9/3.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit

class XYOpinionController: XYViewController {

    lazy var commonView = XYProfileCommonView(frame: CGRect(), labelHidden: true)
    override func viewDidLoad() {
        super.viewDidLoad()
        commonView = XYProfileCommonView(frame: view.bounds, labelHidden: true)
        view.addSubview(commonView)
    }
}
