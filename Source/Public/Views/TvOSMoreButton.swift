//
//  TvOSMoreButton.swift
//
// Copyright (c) 2016-2017 Chris Goldsby
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

import Foundation

open class TvOSMoreButton: UIView {
    private var label: UILabel!
    private var focusedView: UIView!
    private var selectGestureRecognizer: UIGestureRecognizer!
    private var isFocusable = false
    
    open var text: String? {
        
        didSet {
            updateUI()
        }
    }
    
    open var textColor = UIColor.white {
        
        didSet {
            label.textColor = textColor
        }
    }
    
    open var font = UIFont.systemFont(ofSize: 25) {
        
        didSet {
            label.font = font
        }
    }
    
    open var ellipsesString = String.ExpandingDescription.ellipses.🌍
    open var trailingText = String.ExpandingDescription.more.🌍
    open var trailingTextColor = UIColor.black.withAlphaComponent(0.5)
    open var trailingTextFont = UIFont.boldSystemFont(ofSize: 18)
    open var pressAnimationDuration = 0.1
    open var labelMargin = CGFloat(12.0)
    open var cornerRadius = CGFloat(10.0)
    open var focusedScaleFactor = CGFloat(1.05)
    open var shadowRadius = CGFloat(10)
    open var shadowColor = UIColor.black.cgColor
    open var focusedShadowOffset = CGSize(width: 0, height: 27)
    open var focusedShadowOpacity = Float(0.75)
    open var focusedViewAlpha = CGFloat(0.75)
    open var buttonWasPressed: ((String?) -> Void)?
    
    private var textAttributes: [String : Any] {
        return [
            NSForegroundColorAttributeName: textColor,
            NSFontAttributeName: font
        ]
    }
    
    private var trailingTextAttributes: [String : Any] {
        return [
            NSForegroundColorAttributeName: trailingTextColor,
            NSFontAttributeName: trailingTextFont
        ]
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpUI()
    }
    
    override open var intrinsicContentSize: CGSize {
        return label.intrinsicContentSize
    }
    
    override open var canBecomeFocused: Bool {
        return isFocusable
    }
    
    override open func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        coordinator.addCoordinatedAnimations({
            self.isFocused ? self.applyFocusedAppearance() : self.applyUnfocusedAppearance()
        })
    }
    
    open func updateUI() {
        truncateAndUpdateText()
    }
    
    // MARK: - Presses
    
    override open func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        super.pressesBegan(presses, with: event)
        for item in presses where item.type == .select {
            applyPressDownAppearance()
        }
    }
    
    override open func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        super.pressesEnded(presses, with: event)
        for item in presses where item.type == .select {
            applyPressUpAppearance()
        }
    }
    
    override open func pressesCancelled(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        for item in presses where item.type == .select {
            applyPressUpAppearance()
        }
    }
    
    // MARK - Private
    
    private func setUpUI() {
        setUpView()
        setUpFocusedView()
        setUpLabel()
        setUpSelectGestureRecognizer()
        applyUnfocusedAppearance()
    }
    
    private func setUpView() {
        isUserInteractionEnabled = true
        backgroundColor = .clear
        clipsToBounds = false
    }
    
    private func setUpLabel() {
        label = UILabel()
        label.numberOfLines = 0
        addSubview(label)
        
        let labelInsets = UIEdgeInsets(top: labelMargin, left: labelMargin, bottom: labelMargin, right:labelMargin)
        label.pinEdgesToSuperviewEdges(insets: labelInsets)
    }
    
    private func setUpFocusedView() {
        focusedView = UIView()
        focusedView.layer.cornerRadius = cornerRadius
        focusedView.layer.shadowColor = shadowColor
        focusedView.layer.shadowRadius = shadowRadius
        
        addSubview(focusedView)
        focusedView.pinEdgesToSuperviewEdges()
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurredView = UIVisualEffectView(effect: blurEffect)
        blurredView.alpha = focusedViewAlpha
        blurredView.layer.cornerRadius = cornerRadius
        blurredView.layer.masksToBounds = true
        
        focusedView.addSubview(blurredView)
        blurredView.pinEdgesToSuperviewEdges()
    }
    
    private func setUpSelectGestureRecognizer() {
        selectGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectGestureWasPressed))
        selectGestureRecognizer.allowedPressTypes = [NSNumber(value: UIPressType.select.rawValue)]
        addGestureRecognizer(selectGestureRecognizer)
    }
    
    @objc private func selectGestureWasPressed() {
        buttonWasPressed?(text)
    }
    
    // MARK: - Focus Appearance
    
    private func applyFocusedAppearance() {
        transform = CGAffineTransform(scaleX: focusedScaleFactor, y: focusedScaleFactor)
        focusedView.layer.shadowOffset = focusedShadowOffset
        focusedView.layer.shadowOpacity = focusedShadowOpacity
        focusedView.alpha = 1
    }
    
    private func applyUnfocusedAppearance() {
        transform = CGAffineTransform.identity
        focusedView.layer.shadowOffset = .zero
        focusedView.layer.shadowOpacity = 0
        focusedView.alpha = 0
    }
    
    private func applyPressUpAppearance() {
        UIView.animate(withDuration: pressAnimationDuration, animations: {
            self.applyFocusedAppearance()
        })
    }
    
    private func applyPressDownAppearance() {
        UIView.animate(withDuration: pressAnimationDuration, animations: {
            self.transform = CGAffineTransform.identity
            self.focusedView.layer.shadowOffset = .zero
            self.focusedView.layer.shadowOpacity = 0
        })
    }
    
    // MARK: - Truncating Text
    
    private func truncateAndUpdateText() {
        label.text = text
        
        guard let text = text, !text.isEmpty else { return }
        
        layoutIfNeeded()
        let labelSize = label.bounds.size
        let trailingText = " " + self.trailingText
        label.attributedText = text.truncateToSize(size: labelSize,
                                                   ellipsesString: ellipsesString,
                                                   trailingText: trailingText,
                                                   attributes: textAttributes,
                                                   trailingTextAttributes: trailingTextAttributes)
        isFocusable = !text.willFit(to: labelSize, attributes: textAttributes)
    }
}
