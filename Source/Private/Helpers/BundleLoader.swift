//
//  BundleLoader.swift
//  TvOSMoreButton
//
//  Created by Christopher Goldsby on 10/23/16.
//  Copyright © 2016 Christopher Goldsby. All rights reserved.
//

import Foundation


final class BundleLoader {
    
    static let main: Bundle = {
        let podBundle = Bundle(for: BundleLoader.self)
        if let url = podBundle.url(forResource: String(describing: TvOSMoreButton.self), withExtension: "bundle"),
            let bundle = Bundle(url: url) {
            return bundle
        }
        else {
            return .main
        }
    }()
}
