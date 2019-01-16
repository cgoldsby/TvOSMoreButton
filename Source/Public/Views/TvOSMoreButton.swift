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

@objc
open class TvOSMoreButton: UIView {

    /*
     *  FocusableMode.Auto
     *  Focus is allowed only when the text does not fit on the label.
     */
    public enum FocusableMode {
        case auto
        case manual(_ isFocusable: Bool)
    }

    private var label: UILabel!
    private var focusedView: UIView!
    private var selectGestureRecognizer: UIGestureRecognizer!

    private var isFocusable = false {
        didSet {
            if isFocusable {
                accessibilityTraits.remove(.notEnabled)
            }
            else {
                accessibilityTraits.insert(.notEnabled)
            }
        }
    }

    var focusableMode: FocusableMode = .auto {
        didSet {
            switch focusableMode {
            case .manual(let isFocusable):
                self.isFocusable = isFocusable
            default:
                isFocusable = false
            }
        }
    }

    @objc open var text: String? {

        didSet {
            updateUI()
        }
    }

    @objc open var textColor = UIColor.white {

        didSet {
            label.textColor = textColor
        }
    }

    @objc open var font = UIFont.systemFont(ofSize: 25) {

        didSet {
            label.font = font
        }
    }

    @objc open var textAlignment = NSTextAlignment.natural {

        didSet {
            label.textAlignment = textAlignment
        }
    }

    @objc open var ellipsesString = String.TvOSMoreButton.ellipses.🌍 {

        didSet {
            updateUI()
        }
    }

    @objc open var trailingText = String.TvOSMoreButton.more.🌍 {

        didSet {
            updateUI()
        }
    }

    @objc open var trailingTextColor = UIColor.black.withAlphaComponent(0.5)
    @objc open var trailingTextFont = UIFont.boldSystemFont(ofSize: 18)
    @objc open var pressAnimationDuration = 0.1
    @objc open var labelMargin = CGFloat(12.0)
    @objc open var cornerRadius = CGFloat(10.0)
    @objc open var focusedScaleFactor = CGFloat(1.05)
    @objc open var shadowRadius = CGFloat(10)
    @objc open var shadowColor = UIColor.black.cgColor
    @objc open var focusedShadowOffset = CGSize(width: 0, height: 27)
    @objc open var focusedShadowOpacity = Float(0.75)
    @objc open var focusedViewAlpha = CGFloat(0.75)
    @objc open var buttonWasPressed: ((String?) -> Void)?

    private var textAttributes: [NSAttributedString.Key: Any] {
        return [
            .foregroundColor: textColor,
            .font: font
        ]
    }

    private var trailingTextAttributes: [NSAttributedString.Key: Any] {
        return [
            .foregroundColor: trailingTextColor,
            .font: trailingTextFont
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

    // MARK: - Private

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
        isAccessibilityElement = true
        accessibilityTraits = UIAccessibilityTraits.button
        accessibilityIdentifier = "tvos more button"
    }

    private func setUpLabel() {
        label = UILabel()
        label.numberOfLines = 0
        addSubview(label)

        let labelInsets = UIEdgeInsets(top: labelMargin, left: labelMargin, bottom: labelMargin, right: labelMargin)
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
        selectGestureRecognizer.allowedPressTypes = [NSNumber(value: UIPress.PressType.select.rawValue)]
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
        UIView.animate(withDuration: pressAnimationDuration) {
            self.isFocused ? self.applyFocusedAppearance() : self.applyUnfocusedAppearance()
        }
    }

    private func applyPressDownAppearance() {
        UIView.animate(withDuration: pressAnimationDuration) {
            self.transform = CGAffineTransform.identity
            self.focusedView.layer.shadowOffset = .zero
            self.focusedView.layer.shadowOpacity = 0
        }
    }

    // MARK: - Truncating Text

    private func truncateAndUpdateText() {
        label.text = text
        accessibilityLabel = text

        guard let text = text, !text.isEmpty else { return }

        layoutIfNeeded()
        let labelSize = label.bounds.size
        let trailingText = " " + self.trailingText
        label.attributedText = text.truncateToSize(size: labelSize,
                                                   ellipsesString: ellipsesString,
                                                   trailingText: trailingText,
                                                   attributes: textAttributes,
                                                   trailingTextAttributes: trailingTextAttributes)
        accessibilityLabel = label.attributedText?.string

        if case .auto = focusableMode {
            isFocusable = !text.willFit(to: labelSize,
                                        attributes: textAttributes,
                                        trailingTextAttributes: trailingTextAttributes)
        }
    }
}
