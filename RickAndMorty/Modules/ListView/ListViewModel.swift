//
//  ListViewModel.swift
//  RickAndMorty
//
//  Created by Svetlana Shardakova on 06.06.2022.
//

import Foundation

protocol ListViewModelProtocol: AnyObject  {
    var data: [String]? { get }
}

class ListViewModel: ListViewModelProtocol  {
    weak var coordinator: Coordinator?
    weak var viewController: ListViewControllerProtocol?
    var apiManager: APIManagerProtocol
    
    init(viewController: ListViewControllerProtocol, coordinator: Coordinator, apiManager: APIManagerProtocol) {
        self.viewController = viewController
        self.coordinator = coordinator
        self.apiManager = apiManager
    }
    
    var data: [String]? {
        guard let url = URL(string: Const.urlString) else { return nil}
        return apiManager.fetchData(for: url)
    }
}

private enum Const {
    static let urlString = "https://www.random.org/strings/?num=10&len=8&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new"
//    static let urlString: String = "https://rickandmortyapi.com/documentation/#get-all-characters"
//    static let test: String = "https://rickandmortyapi.com/documentation/#get-a-single-character"
}
