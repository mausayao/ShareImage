//
//  ListImagesPresenter.swift
//  Project3
//
//  Created by Maurício Sayão on 15/05/22.
//

import Foundation

protocol ListImagesPresenterLogic {
    func presentView(response: ListImagesModel.RequestView.Response)
}

final class ListImagesPresenter: ListImagesPresenterLogic {
    
    // MARK: - properties
    
    weak var viewController: ListImagesViewController?
    
    // MARK: - ListImagesPresenterLogic implementation
    
    func presentView(response: ListImagesModel.RequestView.Response) {
        let viewModel = ListImagesModel.RequestView.ViewModel(
            data: response.data,
            title: "Lista de Imagens"
        )
        viewController?.displayView(viewModel: viewModel)
    }
}
