//
//  APIManager.swift
//  RickAndMorty
//
//  Created by Svetlana Shardakova on 06.06.2022.
//

import Foundation

protocol APIManagerProtocol {
    func fetchData(for url: URL) -> [String]?
}

class APIManager:  APIManagerProtocol {
    private var data: Data?
    func fetchData(for url: URL) -> [String]? {
        var array: [String]?
        
        if let data = try? Data(contentsOf: url),
           let string = String(data: data, encoding: .ascii) {
            array = string.components(separatedBy: "\n").dropLast()
        }
        return array
    }
}
