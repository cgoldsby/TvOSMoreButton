//
//  LocalizedStrings.swift
//  ExpandingDescriptionView
//
//  Created by Christopher Goldsby on 10/18/16.
//  Copyright © 2016 Christopher Goldsby. All rights reserved.
//

import Foundation


extension String {
    
    enum ExpandingDescription {
        case ellipses
        case more
        
        var 🌍: String {
            switch self {
            case .ellipses:
                return "…"
            case .more:
                return NSLocalizedString(
                    "ExpandingDescription.More.Text",
                    bundle: BundleLoader.main,
                    comment: "Text that appears after a long description in a label."
                    ).uppercased()
            }
        }
    }
}
