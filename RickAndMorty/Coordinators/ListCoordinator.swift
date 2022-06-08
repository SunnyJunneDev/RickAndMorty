//
//  ListCoordinator.swift
//  RickAndMorty
//
//  Created by Svetlana Shardakova on 06.06.2022.
//

import UIKit

final class ListCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    private let apiManager: APIManager
    
    init(navigationController: UINavigationController, apiManager: APIManager) {
        self.navigationController = navigationController
        self.apiManager = apiManager
    }
    
    func start() {
        let listVC = ListViewController()
//        let apiManager = APIManager()
        let viewModel = ListViewModel(viewController: listVC, coordinator: self, apiManager: apiManager)
        listVC.viewModel = viewModel
        viewModel.coordinator = self
        navigationController.setViewControllers([listVC], animated: false)
    }
    
    func showDetailsScreen(for item: Results) {
        let detailsCoordinator = DetailsCoordinator(navigationController: navigationController, apiManager: apiManager)
        childCoordinators.append(detailsCoordinator)
        detailsCoordinator.start(with: item)
    }
}
