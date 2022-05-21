//
//  ListImagesModel.swift
//  Project3
//
//  Created by Maurício Sayão on 15/05/22.
//

enum ListImagesModel {
    
    // MARK: - User cases
    
    enum RequestView {
        struct Response {
            let data: [String]
        }
        
        struct ViewModel {
            let data: [String]
            let title: String
        }
    }
}
