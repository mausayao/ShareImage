//
//  ListImagesDataSource.swift
//  Project3
//
//  Created by Maurício Sayão on 16/05/22.
//

import UIKit

protocol ListiImagesCellProtocol: AnyObject {
    func selected(at imageName: String)
}

final class ListImagesDataSource: NSObject {
    
    // MARK: - Delegate
    
    weak var delegate: ListiImagesCellProtocol?
    
    // MARK: - properties
    
    private var dataList: [String] = []
    private let tableView: UITableView
    
    // MARK: - init
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        self.tableView.register(ListImagesViewCell.self, forCellReuseIdentifier: ListImagesViewCell.identifier)
    }
    
    // MARK: - methods
    
    func setUpData(dataList: [String]) {
        self.dataList = dataList
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource implementation

extension ListImagesDataSource: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListImagesViewCell.identifier) as? ListImagesViewCell else {
            return UITableViewCell()
        }
        
        cell.setUpData(imageName: dataList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selected(at: dataList[indexPath.row])
    }
}
