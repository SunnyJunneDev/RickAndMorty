//
//  UIStackView+addArrangedSubviews.swift
//  RickAndMorty
//
//  Created by Svetlana Shardakova on 08.06.2022.
//

import UIKit

public extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach(addArrangedSubview)
    }
}
