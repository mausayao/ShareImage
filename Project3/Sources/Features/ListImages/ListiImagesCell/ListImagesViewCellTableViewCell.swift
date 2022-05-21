//
//  ListImagesViewCell.swift
//  Project3
//
//  Created by Maurício Sayão on 16/05/22.
//

import UIKit

final class ListImagesViewCell: UITableViewCell, ViewCodable {
    
    // MARK: - identifier
    
    static let identifier = "ListImagesViewCell"
    
    // MARK: - properties
    
    private let label: UILabel = {
        let view = UILabel()
        view.font = view.font.withSize(20)
        view.translatesAutoresizingMaskIntoConstraints = false
    
        return view
    }()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - methods
    
    func setUpData(imageName: String) {
        label.text = imageName
    }
    
    // MARK: - ViewCodable
    
    func setupHierarchy() {
        contentView.addSubview(label)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            label.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupConfig() {
        backgroundColor = .white
        clipsToBounds = true
    }
}
