//
//  XYResourceController.swift
//  XYReadBook
//
//  Created by tsaievan on 2017/9/1.
//  Copyright © 2017年 tsaievan. All rights reserved.
//

import UIKit

fileprivate let kResourceCellId = "kResourceCellId"

class XYResourceController: XYViewController {
    
    var resourceInfo = [[XYElement]]()
    
    lazy var tableView = UITableView(frame: CGRect(), style: .grouped)
    lazy var searchBar = { () -> UISearchBar in
        let searchBar = UISearchBar()
        searchBar.placeholder = "书名, 作者名, 关键字"
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}


// MARK: - 设置UI
extension XYResourceController {
    fileprivate func setupUI() {
        if let info = XYProfileElementVM.resourceElements() {
            resourceInfo = info
        }
        setupTableView()
        setupSearchBar()
        setupTableView()
    }
    
    private func setupSearchBar() {
        navigationItem.titleView = searchBar
    }
    
    private func setupTableView() {
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(XYProfileCell.self, forCellReuseIdentifier: kResourceCellId)
        view.addSubview(tableView)
    }
}


// MARK: - UITableViewDataSource, UITableViewDelegate 数据源方法, 代理回调
extension XYResourceController: UITableViewDataSource, UITableViewDelegate {
    ///< 返回组数
    func numberOfSections(in tableView: UITableView) -> Int {
        return resourceInfo.count
    }
    ///< 返回行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resourceInfo[section].count
    }
    
    ///< 返回cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:kResourceCellId , for: indexPath) as? XYProfileCell
        let model = resourceInfo[indexPath.section][indexPath.row]
        if let cell = cell {
            cell.model = model
            cell.accViewName = model.accessViewName
            return cell
        }
        return UITableViewCell()
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

