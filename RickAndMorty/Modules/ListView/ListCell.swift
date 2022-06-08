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
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    private var stateTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
    }()
    
    private var stateTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    private var stateStackView: UIStackView = {
        var stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
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
        label.numberOfLines = 0
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
        label.numberOfLines = 0
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
        verticalStackView.widthToSuperview()
        verticalStackView.heightToSuperview(multiplier: 0.9)
        
        stateStackView.addArrangedSubviews(stateTitleLabel, stateTextLabel)
        
        lastLocationStackView.addArrangedSubviews(lastLocationTitleLabel, lastLocationTextTitle)
        
        firstAppearanceStackView.addArrangedSubviews(firstAppearanceTitleLabel, firstAppearanceTextLabel)
        
        verticalStackView.addArrangedSubviews(characterNameLabel, stateStackView, lastLocationStackView, firstAppearanceStackView)
        stateStackView.widthToSuperview()
        lastLocationStackView.widthToSuperview()
        firstAppearanceStackView.widthToSuperview()
    }
    
    func configureCell(with character: Results) {
        characterNameLabel.text = character.name
        stateTitleLabel.text = Const.stateTitle
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
    static let stateTitle: String = "State"
    static let lastSeenTitle: String = "Last seen"
    static let firstAppearanceTitle: String = "First appearance"
}
