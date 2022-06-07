//
//  ListViewModel.swift
//  RickAndMorty
//
//  Created by Svetlana Shardakova on 06.06.2022.
//

import Foundation

protocol ListViewModelProtocol: AnyObject  {
    var characters: [Results]? { get }
    var refreshState: (() -> Void)? { get set }
    func getData()
    func selectCharacter(with index: Int)
}

class ListViewModel: ListViewModelProtocol  {
    weak var coordinator: ListCoordinator?
    weak var viewController: ListViewControllerProtocol?
    var apiManager: APIManagerProtocol
    var refreshState: (() -> Void)?
    
    init(viewController: ListViewControllerProtocol, coordinator: ListCoordinator, apiManager: APIManagerProtocol) {
        self.viewController = viewController
        self.coordinator = coordinator
        self.apiManager = apiManager
    }
    
    var characters: [Results]?  = []
    
    func getData() {
        guard let url = URL(string: Const.urlString) else { return }
        apiManager.sendRequest(url: url) { results in // [weak self]
            self.characters = results
            DispatchQueue.main.async {
                self.refreshState?()
            }
        }
    }
    
    func selectCharacter(with index: Int) {
        print("Test1 index \(index)")
        let item = characters?[index]
        print("Test1 item \(item)")
        coordinator?.showDetailsScreen() //for item
    }
    //when selectCell coordinator?.successfullyLoggedIn()
}

private enum Const {
    static let urlString: String = "https://rickandmortyapi.com/api/character"
}
