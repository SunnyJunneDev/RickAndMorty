//
//  DetailsViewModel.swift
//  RickAndMorty
//
//  Created by Svetlana Shardakova on 06.06.2022.
//

import Foundation
import UIKit

protocol DetailsViewModelProtocol: AnyObject  {
    var nameText: String { get }
    var lastLocationLabel: String  { get }
    var lastLocationText: String  { get }
    var firstSeriesLabel: String  { get }
    var firstSeriesText: String { get }
    var characterImage: UIImage  { get }
}

class DetailsViewModel: DetailsViewModelProtocol  {
    weak var coordinator: DetailsCoordinator?
    weak var viewController: DetailsViewControllerProtocol?

    var nameText: String {
        "Rick Long Name" // TODO:
    }
    
    var lastLocationLabel: String {
        Const.lastLocationTitleText
    }
    
    var lastLocationText: String  {
        "Mars" // TODO:
    }
    
    var firstSeriesLabel: String {
        Const.firstSeriesTitleText
    }
    
    var firstSeriesText: String {
        "Episode 2" // TODO:
    }
    
    var characterImage: UIImage {
       UIImage.init(named: "rick") ?? UIImage() // TODO: 
    }
    
    init(viewController: DetailsViewControllerProtocol, coordinator: DetailsCoordinator) {
        self.viewController = viewController
        self.coordinator = coordinator
    }
}

private enum Const {
    static let lastLocationTitleText: String = "Last location:"
    static let firstSeriesTitleText: String = "First appearanse:"
}
