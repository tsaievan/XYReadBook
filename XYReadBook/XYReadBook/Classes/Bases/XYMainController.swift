//
//  XYMainController.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/8/31.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit

class XYMainController: UITabBarController {
    var buttons: [UIView]?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - 设置UI界面
extension XYMainController {
    ///< 设置UI界面
    fileprivate func setupUI() {
        setupChildControllers()
        delegate = self
    }
    
    ///< 设置子控制器
    fileprivate func setupChildControllers() {
        var arrayM = [UIViewController]()
        
        ///< 从json中加载信息
        guard let vcPath = Bundle.main.path(forResource: "XYControIlersInfo.json", ofType: nil),
            let vcData = NSData(contentsOfFile: vcPath) as Data?,
            let vcInfos = try? JSONSerialization.jsonObject(with: vcData, options: []) as? [[String : Any]] ?? [] else {
                return
        }
        for vcDict in vcInfos {
            arrayM.append(controller(dict: vcDict))
        }
        viewControllers = arrayM
        let customTabBar = XYTabBar()
        customTabBar.delegate = self
        buttons = customTabBar.tabBarButtons
        setValue(customTabBar, forKey: "tabBar")
    }
    
    ///< 初始化控制器
    fileprivate func controller(dict: [String : Any]) -> UIViewController {
        guard let clsName = dict["clsName"] as? String,
            let imgName = dict["imgName"] as? String,
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? XYViewController.Type else {
                return UIViewController()
        }
        let vc = cls.init()
        vc.tabBarItem.image = UIImage(named: imgName)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: imgName + "_selected")?.withRenderingMode(.alwaysOriginal)
        let nav = XYNavigationController(rootViewController: vc)
        return nav
        
    }
}


// MARK: - TabBarController的代理方法回调
extension XYMainController: UITabBarControllerDelegate {
    ///< 这个方法是解决进入页面后底下tabBar按钮不高亮的bug, 点击其他按钮之后再取消高亮
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let fVc = (fromVC as? UINavigationController)?.viewControllers.first,
            let tVc = (toVC as? UINavigationController)?.viewControllers.first else {
                return nil
        }
        fVc.tabBarItem.setValue(false, forKey: "selected")
        tVc.tabBarItem.setValue(true, forKey: "selected")
        return nil
    }
}


// MARK: - TabBar的代理方法回调
extension XYMainController {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let tabBarButtons = (tabBar as! XYTabBar).tabBarButtons
        let v = tabBarButtons[item.tag]
        ///< view的大小变化的key是"transform.scale"
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 0.5
        animation.duration = 0.1
        v.layer.add(animation, forKey: "transform.scale")
    }
}

