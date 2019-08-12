//
//  ViewController.swift
//
// Copyright (c) 2016-2019 Chris Goldsby
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
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
        tvOSMoreButton.buttonWasPressed = {
            [weak self] text in
            self?.moreButtonWasPressed(text: text)
        }
    }

    private func moreButtonWasPressed(text: String?) {
        guard let text = text else { return }
        let viewController = TvOSTextViewerViewController()
        viewController.text = text
        viewController.textEdgeInsets = UIEdgeInsets(top: 100, left: 250, bottom: 100, right: 250)
        present(viewController, animated: true)
    }
}
