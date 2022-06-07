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
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = Const.backgroundColor
        tableView.separatorInset = .zero
        //add request for next page on end of scroll
        return tableView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        initSubviews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initSubviews() {
        backgroundColor = Const.backgroundColor
        
        addSubview(tableView)
        tableView.widthToSuperview(multiplier: 0.8)
        tableView.centerXToSuperview()
        tableView.heightToSuperview()
    }
}

private enum Const {
    static let backgroundColor: UIColor = .systemGray6
}
