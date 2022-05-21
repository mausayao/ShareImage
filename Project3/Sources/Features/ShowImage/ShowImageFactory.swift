//
//  ShowImageFactory.swift
//  Project3
//
//  Created by Maurício Sayão on 19/05/22.
//

final class ShowImageFactory {
    func setup() -> ShowImageViewController {
        let view = ShowImageView()
        let presenter = ShowImagePresenter()
        let interactor = ShowImageInteractor(presenter: presenter)
        let router = ShowImageRouter(dataStore: interactor)
        let viewController = ShowImageViewController(showImageView: view, interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
