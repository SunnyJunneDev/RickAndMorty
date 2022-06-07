//
//  ListViewController.swift
//  RickAndMorty
//
//  Created by Svetlana Shardakova on 06.06.2022.
//

import UIKit

protocol ListViewControllerProtocol: AnyObject {}

class ListViewController: UIViewController, ListViewControllerProtocol {
    private lazy var contentView = ListView()
    var viewModel: ListViewModelProtocol!

    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubviews()
        bindToViewModel()
        viewModel.getData()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = Const.navigationTitle
        navigationController?.navigationBar.backgroundColor = Const.backgroundColor
    }
    
    private func bindToViewModel() {
        viewModel.refreshState = { [weak self] in
            self?.contentView.tableView.reloadData()
        }
    }
    
    private func setupSubviews() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.tableView.register(ListCell.self, forCellReuseIdentifier: Const.cellIdentifier)
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.characters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Const.cellIdentifier, for: indexPath) as! ListCell
        
        guard let character = viewModel?.characters?[indexPath.row] else { return UITableViewCell() }
        cell.configureCell(with: character)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectCharacter(with: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Const.cellHeight // TODO: refactor to dynamic height
    }
}

private enum Const {
    static let cellIdentifier: String = "listCell"
    static let navigationTitle: String = "Characters"
    static let cellHeight: CGFloat = 110
    static let backgroundColor: UIColor = .systemGray6
}
