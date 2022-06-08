//
//  DetailsViewController.swift
//  RickAndMorty
//
//  Created by Svetlana Shardakova on 06.06.2022.
//

import UIKit

protocol DetailsViewControllerProtocol: AnyObject {}

class DetailsViewController: UIViewController, DetailsViewControllerProtocol {
    
    private lazy var contentView = DetailsView()
    var viewModel: DetailsViewModelProtocol!

    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()
        bindToViewModel()
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func bindToViewModel() {}
    
    private func initialSetup() {
        contentView.nameTextLabel.text = viewModel.nameText
        
        viewModel.refreshImage = { [weak self] in
            self?.contentView.characterImage.image = self?.viewModel.characterImage
        }

        contentView.lastLocationTitleLabel.text = viewModel.lastLocationLabel
        contentView.lastLocationTextLabel.text = viewModel.lastLocationText
        contentView.firstSeriesTitleLabel.text = viewModel.firstSeriesLabel
        contentView.firstSeriesTextLabel.text = viewModel.firstSeriesText
    }
}

