//
//  DetailsViewModel.swift
//  RickAndMorty
//
//  Created by Svetlana Shardakova on 06.06.2022.
//

import Foundation

protocol DetailsViewModelProtocol: AnyObject  {

}

class DetailsViewModel: DetailsViewModelProtocol  {
    weak var coordinator: DetailsCoordinator?
    weak var viewController: DetailsViewControllerProtocol?
    
    init(viewController: DetailsViewControllerProtocol, coordinator: DetailsCoordinator) {
        self.viewController = viewController
        self.coordinator = coordinator
    }
}
