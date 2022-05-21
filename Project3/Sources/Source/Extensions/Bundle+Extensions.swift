//
//  Bundle+Extensions.swift
//  Project3
//
//  Created by Maurício Sayão on 15/05/22.
//

import Foundation

extension Bundle {
    static func getContent(in path: String = "Content/") -> String? {
        guard let resource = Bundle.main.resourcePath else { return nil }
        return "\(resource)/\(path)"
    }
}
