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
            case ellipses:
                return "…"
            case more:
                return NSLocalizedString("ExpandingDescription.More.Text", bundle: BundleLoader.mainBundle, comment: "Text that appears after a long description in a label.").uppercaseString
            }
        }
    }
}

private class BundleLoader {
    
    static var mainBundle: NSBundle {
        let podBundle = NSBundle(forClass: BundleLoader.self)
        let resourceUrl  = podBundle.URLForResource("ExpandingDescriptionView", withExtension: "bundle")!
        return NSBundle(URL: resourceUrl)!
    }
}
