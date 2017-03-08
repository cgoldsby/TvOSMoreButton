//
//  ViewController.swift
//  Example
//
//  Created by Christopher Goldsby on 10/23/16.
//  Copyright © 2016 Christopher Goldsby. All rights reserved.
//

import UIKit
import TvOSMoreButton
import TvOSTextViewer


final class ViewController: UIViewController {
    
    @IBOutlet private weak var tvOSMoreButton: TvOSMoreButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    // MARK: - Private
    
    private func setUpUI() {
        tvOSMoreButton.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum scelerisque a libero quis auctor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam aliquam sem sit amet turpis gravida molestie a quis mauris. Sed metus nunc, imperdiet id vestibulum vulputate, ultricies quis erat. Quisque dictum, leo vitae pulvinar convallis, lorem lacus congue arcu, a mattis enim nisi eu diam. Phasellus vehicula iaculis maximus. Integer et ex felis. Curabitur nibh ex, commodo eget libero vitae, sodales pretium tellus. Maecenas at imperdiet lorem. Phasellus sed laoreet arcu. Mauris auctor lacus libero, vel blandit ex dapibus non. Ut at lectus nec magna tempus vehicula id at odio. Quisque cursus dui a efficitur fringilla. Ut vel lectus quis odio dignissim scelerisque. Pellentesque varius urna auctor quam faucibus commodo."
        tvOSMoreButton.buttonWasPressed = moreButtonWasPressed
    }
    
    private func moreButtonWasPressed(text: String?) -> Void {
        
    }
}
