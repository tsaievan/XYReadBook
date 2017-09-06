//
//  XYProfileController.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/9/1.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit
import YYModel


let cellId = "cellId"

class XYProfileController: XYViewController {
    
    lazy var tableView = UITableView()
    var cellInfo = [[XYElement]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - 设置UI
extension XYProfileController {
    fileprivate func setupUI() {
        if let info = XYProfileElementVM.profileElements() {
            cellInfo = info
        }
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.isPagingEnabled = false
        tableView.bounces = false
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        let header = XYProfileHeader(frame: CGRect(x: 0, y: 0, width: UIScreen.hm_screenWidth(), height: 180))
        header.backgroundColor = UIColor.hm_color(withHex: 0xF1F1F1)
        tableView.tableHeaderView = header
        tableView.register(XYProfileCell.self, forCellReuseIdentifier: cellId)
    }
}


// MARK: - 数据源方法, 代理方法
extension XYProfileController: UITableViewDataSource, UITableViewDelegate{
    ///< 返回组数
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellInfo.count
    }
    
    ///< 返回行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellInfo[section].count
    }
    
    ///< 返回cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:cellId , for: indexPath) as? XYProfileCell
        let model = cellInfo[indexPath.section][indexPath.row]
        if let cell = cell {
            cell.model = model
            cell.accViewName = model.accessViewName
            return cell
        }
        return UITableViewCell()
    }
    
    ///< 返回cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    ///< 返回组尾高度
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    ///< 返回组头高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.2
    }
    
    ///< 点击cell后触发的事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellModel = cellInfo[indexPath.section][indexPath.row]
        let clsName = cellModel.next ?? ""
        let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? XYViewController.Type
        let vc = cls?.init()
        show(vc ?? UIViewController(), sender: nil)
    }
}
