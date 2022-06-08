//
//  DetailsView.swift
//  RickAndMorty
//
//  Created by Svetlana Shardakova on 06.06.2022.
//

import TinyConstraints
import UIKit

class DetailsView: UIView {
    
    let characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()

    let nameTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    let lastLocationTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
    }()
    
    let lastLocationTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    let firstSeriesTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
    }()
    
    let firstSeriesTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        backgroundColor = Const.backgroundColor
        
        // TODO: Convert into StackView
        addSubviews(nameTextLabel, lastLocationTitleLabel, lastLocationTextLabel, firstSeriesTitleLabel, firstSeriesTextLabel, characterImage)
        
        characterImage.topToSuperview(offset: 70) //TODO: CONST
        characterImage.widthToSuperview(multiplier: 0.6)
        characterImage.heightToWidth(of: characterImage)
        characterImage.centerXToSuperview()
        
        
        nameTextLabel.topToBottom(of: characterImage, offset: 10)
        nameTextLabel.centerXToSuperview()
        
        lastLocationTitleLabel.topToBottom(of: nameTextLabel, offset: 20)
        lastLocationTitleLabel.widthToSuperview()
        
        lastLocationTextLabel.topToBottom(of: lastLocationTitleLabel, offset: 8)
        lastLocationTextLabel.widthToSuperview()
        
        firstSeriesTitleLabel.topToBottom(of: lastLocationTextLabel, offset: 20)
        firstSeriesTitleLabel.widthToSuperview()
        
        firstSeriesTextLabel.topToBottom(of: firstSeriesTitleLabel, offset: 8)
        firstSeriesTextLabel.widthToSuperview()
    }
}

private enum Const {
    static let backgroundColor: UIColor = .systemGray6
}
