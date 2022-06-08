//
//  ListCell.swift
//  RickAndMorty
//
//  Created by Svetlana Shardakova on 08.06.2022.
//

import UIKit

class ListCell: UITableViewCell {
    private var verticalStackView: UIStackView = {
        var stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 5
        return stack
    }()
    
    private var characterNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    private var stateTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    private var lastLocationTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
    }()
    
    private var lastLocationTextTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    private var lastLocationStackView: UIStackView = {
        var stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private var firstAppearanceTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
    }()
    
    private var firstAppearanceTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        return label
    }()
    
    private var firstAppearanceStackView: UIStackView = {
        var stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        backgroundColor = Const.backgroundColor
        
        contentView.addSubviews(verticalStackView)
        verticalStackView.widthToSuperview(multiplier: Const.multiplier)
        verticalStackView.centerXToSuperview()
        verticalStackView.heightToSuperview(multiplier: Const.multiplier)
        
        lastLocationStackView.addArrangedSubviews(lastLocationTitleLabel, lastLocationTextTitle)
        
        firstAppearanceStackView.addArrangedSubviews(firstAppearanceTitleLabel, firstAppearanceTextLabel)
        
        verticalStackView.addArrangedSubviews(characterNameLabel, stateTextLabel, lastLocationStackView, firstAppearanceStackView)
        lastLocationStackView.widthToSuperview()
        firstAppearanceStackView.widthToSuperview()
    }
    
    func configureCell(with character: Results) {
        characterNameLabel.text = character.name
        stateTextLabel.text = character.status
        lastLocationTitleLabel.text = Const.lastSeenTitle
        lastLocationTextTitle.text = character.location.name
        firstAppearanceTitleLabel.text = Const.firstAppearanceTitle
        let episode = character.episode.first?.components(separatedBy: "/").last ?? ""
        firstAppearanceTextLabel.text = "Episode \(episode)"
    }
}

private enum Const {
    static let backgroundColor: UIColor = .systemGray6
    static let multiplier: Double = 0.9
    static let lastSeenTitle: String = "Last seen"
    static let firstAppearanceTitle: String = "First appearance"
}
