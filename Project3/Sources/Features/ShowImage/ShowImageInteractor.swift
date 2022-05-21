//
//  ShowImageInteractor.swift
//  Project3
//
//  Created by Maurício Sayão on 18/05/22.
//

import Foundation

protocol ShowImageInteractorProtocol: AnyObject {
    func requestView()
}

protocol ShowImageDataStore: AnyObject {
    var imageName: String? { get set }
}

final class ShowImageInteractor: ShowImageInteractorProtocol, ShowImageDataStore {
    
    // MARK: - ShowImageDataStore
    var imageName: String?
    
    // MARK: - Private properties
    
    private let presenter: ShowImagePresenterLogic
    
    init(presenter: ShowImagePresenterLogic) {
        self.presenter = presenter
    }
    
    // MARK: - ShowImageInteractorProtocol
    
    func requestView() {
        let response = ShowImageModel.RequestView.response(imageName: imageName ?? "")
        presenter.presentView(response: response)
        
    }
}
