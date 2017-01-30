//
//  FocusableScrollView.swift
//  ExpandingDescriptionView
//
//  Created by Christopher Goldsby on 10/20/16.
//  Copyright © 2016 Christopher Goldsby. All rights reserved.
//

import Foundation


final class FocusableScrollView: UIScrollView {
    
    override var canBecomeFocused : Bool {
        return true
    }
}
