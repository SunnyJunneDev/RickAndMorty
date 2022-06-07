//
//  Character.swift
//  RickAndMorty
//
//  Created by Svetlana Shardakova on 07.06.2022.
//

import Foundation

struct Character: Decodable {
    let info: Info?
    let results: [Results]?
}

struct Info: Decodable {
    let count: Int?
    let pages: Int?
    let prev: String?
    let next: String?
}

struct Results: Decodable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let image: String?
    let location: Location
    let episode: [String]
}

struct Location : Decodable {
    let name : String?
    let url : String?
}
