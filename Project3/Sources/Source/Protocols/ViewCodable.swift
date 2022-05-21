//
//  ViewCodable.swift
//  Project3
//
//  Created by Maurício Sayão on 15/05/22.
//

import Foundation

protocol ViewCodable: AnyObject {
    
    func setupHierarchy()
    func setupConstraint()
    func setupConfig()
}

extension ViewCodable {
    
    func setupView() {
        setupHierarchy()
        setupConstraint()
        setupConfig()
    }
}
