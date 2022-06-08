//
//  UIView+addSubviews.swift
//  RickAndMorty
//
//  Created by Svetlana Shardakova on 08.06.2022.
//

import UIKit

public extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
