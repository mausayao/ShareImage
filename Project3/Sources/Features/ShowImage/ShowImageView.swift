//
//  ShowImageView.swift
//  Project3
//
//  Created by Maurício Sayão on 18/05/22.
//

import UIKit

protocol ShowImageViewProtocol: AnyObject {
    func configureView(viewModel: ShowImageModel.RequestView.viewModel)
}

final class ShowImageView: View, ShowImageViewProtocol {
    
    // MARK: - Subviews
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.frame = UIScreen.main.bounds
        return view
    }()
    
    // MARK: - ViewCodable
    
    override func setupHierarchy() {
        super.setupHierarchy()
        addSubview(imageView)
    }
    
    override func setupConstraint() {
        super.setupConstraint()
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    override func setupConfig() {
        super.setupConfig()
        backgroundColor = .white
    }
    
    // MARK: - ShowImageViewProtocol
    
    func configureView(viewModel: ShowImageModel.RequestView.viewModel) {
        
        guard let path = Bundle.getContent(),
              let imageToLoad = UIImage(contentsOfFile: "\(path)\(viewModel.imageName)") else { return }
        
        imageView.image = imageToLoad
        
    }
}
