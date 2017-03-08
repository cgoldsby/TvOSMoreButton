//
//  UIView+Autolayout.swift
//  TvOSMoreButton
//
//  Created by Christopher Goldsby on 10/19/16.
//  Copyright © 2016 Christopher Goldsby. All rights reserved.
//

import UIKit


extension UIView {
    
    func pinEdgesToSuperviewEdges(insets: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        
        translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top)
        let bottomConstraint = bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom)
        let leftConstraint = leftAnchor.constraint(equalTo: superview.leftAnchor, constant: insets.left)
        let rightConstraint = rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -insets.right)
        superview.addConstraints([topConstraint, bottomConstraint, leftConstraint, rightConstraint])
    }
}
