//
//  ListView.swift
//  RickAndMorty
//
//  Created by Svetlana Shardakova on 06.06.2022.
//

import TinyConstraints
import UIKit

class ListView: UIView {
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = false
        return tableView
    }()

//    let titleLabel: UILabel = {
//        let label = UILabel()
//        label.numberOfLines = 0
//        label.font = UIFont.boldSystemFont(ofSize: 14)
//        label.textColor = .white
//        label.textAlignment = .center
//        return label
//    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        initSubviews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initSubviews() {
        backgroundColor = .purple
        addSubview(tableView)
        tableView.widthToSuperview()
        tableView.heightToSuperview()
    }
}
