//
//  ShowImagePresenter.swift
//  Project3
//
//  Created by Maurício Sayão on 18/05/22.
//

import Foundation

protocol ShowImagePresenterLogic: AnyObject {
    func presentView(response: ShowImageModel.RequestView.response)
}

final class ShowImagePresenter: ShowImagePresenterLogic {
    
    weak var viewController: ShowImageViewController?
    
    // MARK: - ShowImagePresenterLogic
    
    func presentView(response: ShowImageModel.RequestView.response) {
        let title = response.imageName.split(separator: ".")[0].uppercased()
        let viewModel = ShowImageModel.RequestView.viewModel(
            imageName: response.imageName,
            title: title
        )
        
        viewController?.displayView(viewModel: viewModel)
    }
}
