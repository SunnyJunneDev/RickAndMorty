//
//  AppCoordinator.swift
//  RickAndMorty
//
//  Created by Svetlana Shardakova on 06.06.2022.
//

import UIKit

protocol Coordinator: AnyObject{
    var childCoordinators: [Coordinator] { get }
}

class AppCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        let apiManager = APIManager()
        
        let listCoordinator = ListCoordinator(navigationController: navigationController, apiManager: apiManager)
        listCoordinator.start()
        childCoordinators.append(listCoordinator)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
