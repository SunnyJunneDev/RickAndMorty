//
//  DetailsView.swift
//  RickAndMorty
//
//  Created by Svetlana Shardakova on 06.06.2022.
//
//tinyConstr
import UIKit

class DetailsView: UIView {

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
        backgroundColor = .orange
        
        
    }
    
}
