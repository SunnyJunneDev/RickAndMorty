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
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let detailsVC = DetailsViewController()
        let viewModel = DetailsViewModel(viewController: detailsVC, coordinator: self)
        detailsVC.viewModel = viewModel
        navigationController.pushViewController(detailsVC, animated: true)
    }
}
