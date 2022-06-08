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
        imageView.layer.cornerRadius = Const.imageCornerRadius
        imageView.layer.masksToBounds = true
        return imageView
    }()

    let nameTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    let lastLocationTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = .secondaryLabel
        label.textAlignment = .left
        return label
    }()
    
    let lastLocationTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    let firstSeriesTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = .secondaryLabel
        label.textAlignment = .left
        return label
    }()
    
    let firstSeriesTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.textAlignment = .left
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
        
        addSubviews(nameTextLabel, lastLocationTitleLabel, lastLocationTextLabel, firstSeriesTitleLabel, firstSeriesTextLabel, characterImage)
        
        characterImage.topToSuperview(offset: Const.imageTopInset)
        characterImage.widthToSuperview(multiplier: Const.multiplier)
        characterImage.heightToWidth(of: characterImage)
        characterImage.centerXToSuperview()
        
        nameTextLabel.topToBottom(of: characterImage, offset: Const.titleTopInset)
        nameTextLabel.centerXToSuperview()
        
        lastLocationTitleLabel.topToBottom(of: nameTextLabel, offset: Const.sectionInset)
        lastLocationTitleLabel.widthToSuperview(multiplier: Const.multiplier)
        lastLocationTitleLabel.centerXToSuperview()
        
        lastLocationTextLabel.topToBottom(of: lastLocationTitleLabel, offset: Const.labelTopInset)
        lastLocationTextLabel.widthToSuperview(multiplier: Const.multiplier)
        lastLocationTextLabel.centerXToSuperview()
        
        firstSeriesTitleLabel.topToBottom(of: lastLocationTextLabel, offset: Const.sectionInset)
        firstSeriesTitleLabel.widthToSuperview(multiplier: Const.multiplier)
        firstSeriesTitleLabel.centerXToSuperview()
        
        firstSeriesTextLabel.topToBottom(of: firstSeriesTitleLabel, offset: Const.labelTopInset)
        firstSeriesTextLabel.widthToSuperview(multiplier: Const.multiplier)
        firstSeriesTextLabel.centerXToSuperview()
    }
}

private enum Const {
    static let imageCornerRadius: CGFloat = 5
    static let imageTopInset: CGFloat = 70
    static let titleTopInset: CGFloat = 12
    static let labelTopInset: CGFloat = 8
    static let sectionInset: CGFloat = 20
    static let multiplier: Double = 0.9
    static let backgroundColor: UIColor = .systemGray6
}
