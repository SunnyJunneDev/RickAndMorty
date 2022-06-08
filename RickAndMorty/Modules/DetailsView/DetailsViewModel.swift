//
//  DetailsViewModel.swift
//  RickAndMorty
//
//  Created by Svetlana Shardakova on 06.06.2022.
//

import Alamofire //temp
import Foundation
import UIKit

protocol DetailsViewModelProtocol: AnyObject  {
    var nameText: String { get }
    var lastLocationLabel: String  { get }
    var lastLocationText: String  { get }
    var firstSeriesLabel: String  { get }
    var firstSeriesText: String { get }
    var characterImage: UIImage  { get }
    
    var refreshImage: (() -> Void)? { get set }
}

class DetailsViewModel: DetailsViewModelProtocol  {
    weak var coordinator: DetailsCoordinator?
    weak var viewController: DetailsViewControllerProtocol?
    weak var apiManager: APIManager?
    
    var refreshImage: (() -> Void)?
    
    private var character: Results

    var nameText: String {
        character.name ?? "No name"
    }
    
    var lastLocationLabel: String {
        Const.lastLocationTitleText
    }
    
    var lastLocationText: String  {
        character.location.name ?? "No location"
    }
    
    var firstSeriesLabel: String {
        Const.firstSeriesTitleText
    }
    
    var firstSeriesText: String {
        guard let episode = character.episode.first?.components(separatedBy: "/").last else { return ""}
        return "Episode \(episode)"
    }

    var characterImage = UIImage()
    
    func downloadImage() {
        guard let url = URL(string: character.image ?? "") else { return }
        apiManager?.getImage(url) { (imageData) in
            guard let img = imageData else { return }
            self.characterImage = img
            self.refreshImage?()
        }
    }
    
    init(viewController: DetailsViewControllerProtocol, coordinator: DetailsCoordinator, parameter: Results, apiManager: APIManager) {
        self.viewController = viewController
        self.coordinator = coordinator
        self.character = parameter
        self.apiManager = apiManager
        
        downloadImage()
    }
}

private enum Const {
    static let lastLocationTitleText: String = "Last location:"
    static let firstSeriesTitleText: String = "First appearanse:"
}
