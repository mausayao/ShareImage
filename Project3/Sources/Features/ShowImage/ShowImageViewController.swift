//
//  ShowImageViewController.swift
//  Project3
//
//  Created by Maurício Sayão on 18/05/22.
//

import UIKit

protocol ShowImageViewControllerDisplayLogic: AnyObject {
    func displayView(viewModel: ShowImageModel.RequestView.viewModel)
    
    func displayShare()
}

final class ShowImageViewController: ViewController, ShowImageViewControllerDisplayLogic {
    
    // MARK: - Properties
    
    private let interactor: ShowImageInteractorProtocol
    private let showImageView: ShowImageView
    let router: (ShowImageRouterLogic & ShowImageDataPassing)
    
    // MARK: - Init
    
    init(showImageView: ShowImageView, interactor: ShowImageInteractorProtocol, router: (ShowImageRouterLogic & ShowImageDataPassing)) {
        self.showImageView = showImageView
        self.interactor = interactor
        self.router = router
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.requestView()
        configureRightButton()
    }
    
    override func loadView() {
        super.loadView()
        view = showImageView
    }
    
    // MARK: - Private methods
    
    private func configureRightButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(displayShare)
        )
    }
    
    // MARK: - ShowImageViewControllerDisplayLogic
    
    func displayView(viewModel: ShowImageModel.RequestView.viewModel) {
        title = viewModel.title
        showImageView.configureView(viewModel: viewModel)
    }
    
    @objc func displayShare() {
        router.routeToShare()
    }
}
