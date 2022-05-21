//
//  View.swift
//  Project3
//
//  Created by Maurício Sayão on 15/05/22.
//

import UIKit

class View: UIView, ViewCodable {
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHierarchy() {
        
    }
    
    func setupConstraint() {
        
    }
    
    func setupConfig() {
        
    }
}

