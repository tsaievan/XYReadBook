//
//  XYSettingController.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/9/3.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit

class XYSettingController: XYViewController {
    lazy var tableView = UITableView()
    var cellInfo = [[XYElement]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    fileprivate func setupUI() {
        if let info = XYProfileElementVM.settingElements() {
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
        tableView.register(XYSettingCell.self, forCellReuseIdentifier: cellId)

    }
}


// MARK: - 数据源方法, 代理方法
extension XYSettingController: UITableViewDataSource, UITableViewDelegate{
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
        let cell = tableView.dequeueReusableCell(withIdentifier:cellId , for: indexPath) as? XYSettingCell
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
}
