//
//  ListImagesWorker.swift
//  Project3
//
//  Created by Maurício Sayão on 15/05/22.
//

import Foundation

protocol ListImagesWorkerProtocol: AnyObject {
    func fetchImages() -> [String]
}

final class ListImagesWorker: ListImagesWorkerProtocol {
    
    func fetchImages() -> [String] {
        
        let items = FileManager.getImages()
        
        var pictures = [String]()
        
        if !items.isEmpty {
            for item in items {
                if item.hasPrefix("nssl") {
                    pictures.append(item)
                }
            }
        }
        
        return pictures
    }
}
