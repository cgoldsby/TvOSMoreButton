//
//  ExpandingDescriptionView.swift
//  ExpandingDescriptionView
//
//  Created by Christopher Goldsby on 10/18/16.
//  Copyright © 2016 Christopher Goldsby. All rights reserved.
//

import Foundation


public class ExpandingDescriptionView: UIView {
    
    private var label: UILabel!
    private var focusedView: UIView!
    private var selectGestureRecognizer: UIGestureRecognizer!
    private var isFocusable = false
    
    public var text: String? {
        
        didSet {
            updateUI()
        }
    }
    
    public var textColor = UIColor.whiteColor() {
        
        didSet {
            label.textColor = textColor
        }
    }
    
    public var font = UIFont.systemFontOfSize(25) {
        
        didSet {
            label.font = font
        }
    }
    
    public var ellipsesString = String.ExpandingDescription.ellipses.🌍
    public var trailingText = String.ExpandingDescription.more.🌍
    public var trailingTextColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
    public var trailingTextFont = UIFont.boldSystemFontOfSize(18)
    public var pressAnimationDuration = 0.1
    public var labelMargin = CGFloat(12.0)
    public var cornerRadius = CGFloat(10.0)
    public var focusedScaleFactor = CGFloat(1.05)
    public var shadowRadius = CGFloat(10)
    public var shadowColor = UIColor.blackColor().CGColor
    public var focusedShadowOffset = CGSize(width: 0, height: 27)
    public var focusedShadowOpacity = Float(0.75)
    public var focusedViewAlpha = CGFloat(0.75)
    public var descriptionViewController = DescriptionViewController()
    @IBOutlet public weak var presenterViewController: UIViewController?
    
    private var textAttributes: [String : AnyObject] {
        return [
            NSForegroundColorAttributeName: textColor,
            NSFontAttributeName: font
        ]
    }
    
    private var trailingTextAttributes: [String : AnyObject] {
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
    
    override public func intrinsicContentSize() -> CGSize {
        return label.intrinsicContentSize()
    }
    
    override public func canBecomeFocused() -> Bool {
        return isFocusable
    }
    
    override public func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        coordinator.addCoordinatedAnimations({
            self.focused ? self.applyFocusedAppearance() : self.applyUnfocusedAppearance()
            }, completion: nil)
    }
    
    public func updateUI() {
        truncateAndUpdateText()
    }
    
    public func presentDescriptionViewController() {
        descriptionViewController.text = text
        descriptionViewController.modalPresentationStyle = .OverCurrentContext
        presenterViewController?.presentViewController(descriptionViewController, animated: true, completion: nil)
    }
    
    // MARK: - Presses
    
    override public func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        super.pressesBegan(presses, withEvent: event)
        for item in presses where item.type == .Select {
            applyPressDownAppearance()
        }
    }
    
    override public func pressesEnded(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        super.pressesEnded(presses, withEvent: event)
        for item in presses where item.type == .Select {
            applyPressUpAppearance()
        }
    }
    
    override public func pressesCancelled(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        for item in presses where item.type == .Select {
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
        userInteractionEnabled = true
        backgroundColor = .clearColor()
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
        
        let blurEffect = UIBlurEffect(style: .Light)
        let blurredView = UIVisualEffectView(effect: blurEffect)
        blurredView.alpha = focusedViewAlpha
        blurredView.layer.cornerRadius = cornerRadius
        blurredView.layer.masksToBounds = true
        
        focusedView.addSubview(blurredView)
        blurredView.pinEdgesToSuperviewEdges()
    }
    
    private func setUpSelectGestureRecognizer() {
        selectGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(presentDescriptionViewController))
        selectGestureRecognizer.allowedPressTypes = [UIPressType.Select.rawValue]
        addGestureRecognizer(selectGestureRecognizer)
    }
    
    // MARK: - Focus Appearance
    
    private func applyFocusedAppearance() {
        transform = CGAffineTransformMakeScale(focusedScaleFactor, focusedScaleFactor)
        focusedView.layer.shadowOffset = focusedShadowOffset
        focusedView.layer.shadowOpacity = focusedShadowOpacity
        focusedView.alpha = 1
    }
    
    private func applyUnfocusedAppearance() {
        transform = CGAffineTransformIdentity
        focusedView.layer.shadowOffset = .zero
        focusedView.layer.shadowOpacity = 0
        focusedView.alpha = 0
    }
    
    private func applyPressUpAppearance() {
        UIView.animateWithDuration(pressAnimationDuration) {
            self.applyFocusedAppearance()
        }
    }
    
    private func applyPressDownAppearance() {
        UIView.animateWithDuration(pressAnimationDuration) {
            self.transform = CGAffineTransformIdentity
            self.focusedView.layer.shadowOffset = .zero
            self.focusedView.layer.shadowOpacity = 0
        }
    }
    
    // MARK: - Truncating Text
    
    private func truncateAndUpdateText() {
        label.text = text
        
        guard let text = text where !text.isEmpty else { return }
        
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
