//
//  DescriptionViewController.swift
//  ExpandingDescriptionView
//
//  Created by Christopher Goldsby on 10/20/16.
//  Copyright © 2016 Christopher Goldsby. All rights reserved.
//

import UIKit


public class DescriptionViewController: UIViewController {
    
    private var descriptionLabel: UILabel!
    private var scrollView: UIScrollView!
    private var contentView: UIView!
    
    private var isContentViewHeightSmallerThanScrollViewHeight: Bool {
        let scrollViewBounds = scrollView.bounds
        let contentViewBounds = contentView.bounds
        return contentViewBounds.height < scrollViewBounds.height
    }
    
    public var text: String? {
        
        didSet {
            guard isViewLoaded() else { return }
            updateDescriptionLabel()
        }
    }
    
    public var textColor = UIColor.whiteColor()
    public var font = UIFont.systemFontOfSize(25)
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override public func viewDidLayoutSubviews() {
        if isContentViewHeightSmallerThanScrollViewHeight {
            positionContentViewInCenterOfScrollView()
        }
        else {
            scrollView.contentInset = .zero
        }
    }
    
    // MARK: - Private
    
    private func updateUI() {
        setUpView()
        setUpScrollView()
        setUpContentView()
        setUpDescriptionLabel()
        updateDescriptionLabel()
    }
    
    private func setUpView() {
        view.backgroundColor = .clearColor()
        let blurEffect = UIBlurEffect(style: .Dark)
        let blurredView = UIVisualEffectView(effect: blurEffect)
        view.addSubview(blurredView)
        blurredView.pinEdgesToSuperviewEdges()
    }
    
    private func setUpScrollView() {
        scrollView = FocusableScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clearColor()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.panGestureRecognizer.allowedTouchTypes = [UITouchType.Indirect.rawValue]
        scrollView.bounces = true
        
        view.addSubview(scrollView)
        scrollView.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        scrollView.widthAnchor.constraintEqualToConstant(1150).active = true
        scrollView.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 80).active = true
        scrollView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: -80).active = true
    }
    
    private func setUpContentView() {
        contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        contentView.pinEdgesToSuperviewEdges()
        contentView.widthAnchor.constraintEqualToAnchor(scrollView.widthAnchor).active = true
    }
    
    private func setUpDescriptionLabel() {
        descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        descriptionLabel.pinEdgesToSuperviewEdges()
    }
    
    private func updateDescriptionLabel() {
        descriptionLabel.text = text
        descriptionLabel.textColor = textColor
        descriptionLabel.font = font
        view.layoutIfNeeded()
    }
    
    private func positionContentViewInCenterOfScrollView() {
        let scrollViewBounds = scrollView.bounds
        let contentViewBounds = contentView.bounds
        
        var scrollViewInsets = UIEdgeInsets.zero
        scrollViewInsets.top = scrollViewBounds.size.height / 2
        scrollViewInsets.top -= contentViewBounds.size.height / 2
        
        scrollViewInsets.bottom = scrollViewBounds.size.height / 2
        scrollViewInsets.bottom -= contentViewBounds.size.height / 2
        
        scrollView.contentInset = scrollViewInsets
    }
}
