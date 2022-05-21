//
//  ListiImagesRouter.swift
//  Project3
//
//  Created by Maurício Sayão on 19/05/22.
//

import Foundation

protocol ListiImagesRouterLogic: AnyObject {
    func routerToShowImage(imageName: String)
}

final class ListiImagesRouter: ListiImagesRouterLogic {
    
    weak var viewController: (ViewController & ListImagesViewControllerDisplayLogic)?

    // MARK: - ListiImagesRouterLogic
    func routerToShowImage(imageName: String) {
        let vc = ShowImageFactory().setup()
        let dataPassing = vc.router.dataStore
        dataPassing.imageName = imageName
        
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
