//
//  DetailsCoordinator.swift
//  RickAndMorty
//
//  Created by Svetlana Shardakova on 06.06.2022.
//

import UIKit

final class DetailsCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    var apiManager: APIManager
    
    init(navigationController: UINavigationController, apiManager: APIManager) {
        self.navigationController = navigationController
        self.apiManager = apiManager
    }
    
    func start(with item: Results) {
        let detailsVC = DetailsViewController()
        let viewModel = DetailsViewModel(viewController: detailsVC, coordinator: self, parameter: item, apiManager: apiManager)
        detailsVC.viewModel = viewModel
        navigationController.pushViewController(detailsVC, animated: true)
    }
}
