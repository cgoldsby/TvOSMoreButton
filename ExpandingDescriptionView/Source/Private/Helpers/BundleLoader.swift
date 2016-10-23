//
//  BundleLoader.swift
//  ExpandingDescriptionView
//
//  Created by Christopher Goldsby on 10/23/16.
//  Copyright © 2016 Christopher Goldsby. All rights reserved.
//

import Foundation


final class BundleLoader {
    
    static var mainBundle: NSBundle {
        let podBundle = NSBundle(forClass: BundleLoader.self)
        if let resourceUrl  = podBundle.URLForResource("ExpandingDescriptionView", withExtension: "bundle"),
            let bundle = NSBundle(URL: resourceUrl) {
            return bundle
        }
        else {
            return .mainBundle()
        }
    }
}
