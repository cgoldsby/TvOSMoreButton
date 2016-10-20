//
//  UIView+Autolayout.swift
//  ExpandingDescriptionView
//
//  Created by Christopher Goldsby on 10/19/16.
//  Copyright © 2016 Christopher Goldsby. All rights reserved.
//

import UIKit


extension UIView {
    
    func pinEdgesToSuperviewEdges(insets insets: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        
        translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = topAnchor.constraintEqualToAnchor(superview.topAnchor, constant: insets.top)
        let bottomConstraint = bottomAnchor.constraintEqualToAnchor(superview.bottomAnchor, constant: -insets.bottom)
        let leftConstraint = leftAnchor.constraintEqualToAnchor(superview.leftAnchor, constant: insets.left)
        let rightConstraint = rightAnchor.constraintEqualToAnchor(superview.rightAnchor, constant: -insets.right)
        superview.addConstraints([topConstraint, bottomConstraint, leftConstraint, rightConstraint])
    }
}

extension UIEdgeInsets {
    
    static var zero: UIEdgeInsets {
        return  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
