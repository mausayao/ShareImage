//
//  ListImagesFactory.swift
//  Project3
//
//  Created by Maurício Sayão on 17/05/22.
//

import UIKit

final class ListImagesFactory {
    func setup() -> UIViewController {
        let worker = ListImagesWorker()
        let presenter = ListImagesPresenter()
        let interactor = ListImagesInteractor(presenter: presenter, worker: worker)
        let view = ListImagesView()
        let router = ListiImagesRouter()
        let viewController = ListImagesViewController(listImagesView: view, interactor: interactor, router: router)
        router.viewController = viewController
        presenter.viewController = viewController
        
        return viewController
    }
}
