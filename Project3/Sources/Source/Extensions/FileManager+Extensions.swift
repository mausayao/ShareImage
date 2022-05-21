//
//  FileManager+Extensions.swift
//  Project3
//
//  Created by Maurício Sayão on 15/05/22.
//

import Foundation

extension FileManager {
    static func getImages() -> [String] {
        guard let path = Bundle.getContent() else { return [] }
        guard let items = try? FileManager.default.contentsOfDirectory(atPath: path) else { return [] }
        return items
    }
}
