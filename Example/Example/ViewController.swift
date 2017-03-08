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
        tvOSMoreButton.text = "It is the year 1985. Marty McFly, a mild-mannered high school student, stopped by Dr. Emmett L. Brown's laboratory to play around with an amplifier. Then he receives a message from Doc that he needs help from him for Doc's latest invention, a time machine made out of a DeLorean sports car that can travel through time instantaneously when it reaches a speed velocity of 88 MPH. Then, Doc was gunned down by Libyan Nationalists, Marty makes an effort to escape from the Lybians by using the time machine. Then Marty accidentally warps himself into 1955. Where he meets both of his parents when they were teenagers, then Marty unintentionally interrupts his parent's first meeting together, he then finds a younger version of Doc and together they try to find a way to get Marty's parents-to-be back together, and to get Marty back to 1985."
        tvOSMoreButton.buttonWasPressed = moreButtonWasPressed
    }
    
    private func moreButtonWasPressed(text: String?) -> Void {
        let viewController = TvOSTextViewerViewController()
        viewController.text = text
        viewController.textColor = .white
        viewController.textEdgeInsets = UIEdgeInsets(top: 100, left: 250, bottom: 100, right: 250)
        present(viewController, animated: true)
    }
}
