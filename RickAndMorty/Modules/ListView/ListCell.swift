//
//  ListCell.swift
//  RickAndMorty
//
//  Created by Svetlana Shardakova on 08.06.2022.
//

import UIKit

class ListCell: UITableViewCell {
    private var characterNameLabel = UILabel()
    private var stateLabel = UILabel()
    private var lastLocationLabel = UILabel()
    private var firstAppearanceLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        backgroundColor = Const.backgroundColor
        
        contentView.addSubviews(characterNameLabel, stateLabel, lastLocationLabel, firstAppearanceLabel)
        characterNameLabel.topToSuperview(offset: 5)
        characterNameLabel.widthToSuperview()
        
        stateLabel.topToBottom(of: characterNameLabel, offset: 5)
        stateLabel.widthToSuperview()
        
        lastLocationLabel.topToBottom(of: stateLabel, offset: 5)
        lastLocationLabel.widthToSuperview()
        
        firstAppearanceLabel.topToBottom(of: lastLocationLabel, offset: 5)
        firstAppearanceLabel.widthToSuperview()
    }
    
    func configureCell(with character: Results) {
        characterNameLabel.text = character.name
        stateLabel.text = character.status
        lastLocationLabel.text = character.location.name
        firstAppearanceLabel.text = character.episode.first
    }
}

private enum Const {
    static let backgroundColor: UIColor = .systemGray6
}
