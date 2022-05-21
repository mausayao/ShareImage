//
//  ListImagesView.swift
//  Project3
//
//  Created by Maurício Sayão on 16/05/22.
//

import UIKit

protocol ListImagesViewDelegate: AnyObject {
    func selected(at imageName: String)
}

protocol ListImagesConfiguraView: AnyObject {
    func configureView(viewModel: ListImagesModel.RequestView.ViewModel)
}

final class ListImagesView: View, ListImagesConfiguraView {
   
    private lazy var dataSource = ListImagesDataSource(tableView: tableView)
    
    // MARK: - Delegate
    
    weak var delegate: ListImagesViewDelegate?
    
    // MARK: - subviews
    
    private let tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.bounces = false
        view.rowHeight = 70.0
        
        return view
    }()
    
    // MARK: - methods
    func configureView(viewModel: ListImagesModel.RequestView.ViewModel) {
        dataSource.setUpData(dataList: viewModel.data)
    }
    
    // MARK: - view codable implemantation
    
    override func setupHierarchy() {
        super.setupHierarchy()
        addSubview(tableView)
    }
    
    override func setupConstraint() {
        super.setupConstraint()
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func setupConfig() {
        super.setupConfig()
        backgroundColor = .white
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        dataSource.delegate = self
    }
}

// MARK: - ListiImagesCellProtocol

extension ListImagesView: ListiImagesCellProtocol{
    func selected(at imageName: String) {
        delegate?.selected(at: imageName)
    }
}
