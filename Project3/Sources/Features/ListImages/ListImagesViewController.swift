//
//  ListImagesViewController.swift
//  Project3
//
//  Created by Maurício Sayão on 15/05/22.
//

import UIKit

protocol ListImagesViewControllerDisplayLogic: AnyObject {
    func displayView(viewModel: ListImagesModel.RequestView.ViewModel)
}

final class ListImagesViewController: ViewController {
    
    // MARK: - properties
    
    private let interactor: ListImagesInteractorProtocol
    private let listImagesView: ListImagesView
    let router: ListiImagesRouterLogic
    
  
    // MARK: - init
    
    init(
        listImagesView: ListImagesView,
        interactor: ListImagesInteractorProtocol,
        router: ListiImagesRouterLogic
    ) {
        self.listImagesView = listImagesView
        self.interactor = interactor
        self.router = router
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - view cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.requestView()
        listImagesView.delegate = self
    }
    
    override func loadView() {
        view = listImagesView
    }
    
}

// MARK: - ListImagesViewControllerDisplayLogic

extension ListImagesViewController: ListImagesViewControllerDisplayLogic {
    func displayView(viewModel: ListImagesModel.RequestView.ViewModel) {
        listImagesView.configureView(viewModel: viewModel)
        title = viewModel.title
    }
}

// MARK: - ListImagesViewDelegate

extension ListImagesViewController: ListImagesViewDelegate {
    func selected(at imageName: String) {
        router.routerToShowImage(imageName: imageName)
    }
}
