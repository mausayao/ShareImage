//
//  ShowImageModel.swift
//  Project3
//
//  Created by Maurício Sayão on 18/05/22.
//

import Foundation

enum ShowImageModel {
    // MARK: - User cases
    
    enum RequestView {
        struct response {
            let imageName: String
        }
        
        struct viewModel {
            let imageName: String
            let title: String
        }
    }
}
