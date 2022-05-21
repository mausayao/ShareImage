//
//  ShowImageRouter.swift
//  Project3
//
//  Created by Maurício Sayão on 19/05/22.
//

import UIKit

protocol ShowImageDataPassing: AnyObject {
    var dataStore: ShowImageDataStore { get set }
}

protocol ShowImageRouterLogic: AnyObject {
    func routeToShare()
}

final class ShowImageRouter: ShowImageRouterLogic, ShowImageDataPassing {
    
    var dataStore: ShowImageDataStore
    weak var viewController: (ViewController & ShowImageViewControllerDisplayLogic)?
    
    init(dataStore: ShowImageDataStore) {
        self.dataStore = dataStore
    }
    
    func routeToShare() {
        guard let path = Bundle.getContent(),
              let name = dataStore.imageName,
              let image = UIImage(contentsOfFile: "\(path)\(name)") else { return }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = viewController?.navigationItem.rightBarButtonItem
           
        viewController?.present(vc, animated: true)
    }
}
