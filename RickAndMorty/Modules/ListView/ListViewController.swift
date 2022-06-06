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
    }
    
    private func bindToViewModel() {

    }
    
    private func setupSubviews() {

        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "listCell")
    }
}


extension ListViewController: UITableViewDataSource, UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        cell.textLabel?.text = viewModel.data?[indexPath.row]
        cell.textLabel?.textColor = .black //moveToConst
          return cell
    }
}
