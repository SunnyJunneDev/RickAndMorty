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

//        initialSetup()
//        setupObservers()
        bindToViewModel()
    }
    
    private func bindToViewModel() {
//        viewModel.showAlert = { [weak self] message in
//            guard let self = self else { return }
//            self.showAlert(with: message)
//        }
    }
}

