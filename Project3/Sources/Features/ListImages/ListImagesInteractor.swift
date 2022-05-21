//
//  ListImagesInteractor.swift
//  Project3
//
//  Created by Maurício Sayão on 15/05/22.
//

import Foundation

protocol ListImagesInteractorProtocol: AnyObject {
    func requestView()
}

protocol ListImagesDataStore: AnyObject {
    var images: [String] { get set }
}

final class ListImagesInteractor: ListImagesInteractorProtocol, ListImagesDataStore {
    
    // MARK: - Data store
    
    var images: [String] = []
    
    // MARK: - properties
    
    private let worker: ListImagesWorkerProtocol
    private let presenter: ListImagesPresenterLogic
    
    // MARK: - init
    
    init(presenter: ListImagesPresenterLogic, worker: ListImagesWorkerProtocol) {
        self.worker = worker
        self.presenter = presenter
    }
    
    // MARK: - ListImagesInteractorProtocol implementation
    
    func requestView() {
        images = worker.fetchImages()
        presenter.presentView(response: ListImagesModel.RequestView.Response(data: images))
    }
}
