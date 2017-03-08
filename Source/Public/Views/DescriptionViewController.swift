//
//  DescriptionViewController.swift
//  ExpandingDescriptionView
//
//  Created by Christopher Goldsby on 10/20/16.
//  Copyright © 2016 Christopher Goldsby. All rights reserved.
//

import UIKit


open class DescriptionViewController: UIViewController {
    
    private var descriptionLabel: UILabel!
    private var scrollView: UIScrollView!
    private var contentView: UIView!
    
    private var isContentViewHeightSmallerThanScrollViewHeight: Bool {
        let scrollViewBounds = scrollView.bounds
        let contentViewBounds = contentView.bounds
        return contentViewBounds.height < scrollViewBounds.height
    }
    
    open var text: String? {
        
        didSet {
            guard isViewLoaded else { return }
            updateDescriptionLabel()
        }
    }
    
    open var textColor = UIColor.white
    open var font = UIFont.systemFont(ofSize: 25)
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override open func viewDidLayoutSubviews() {
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
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: .dark)
        let blurredView = UIVisualEffectView(effect: blurEffect)
        view.addSubview(blurredView)
        blurredView.pinEdgesToSuperviewEdges()
    }
    
    private func setUpScrollView() {
        scrollView = FocusableScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.panGestureRecognizer.allowedTouchTypes = [NSNumber(value: UITouchType.indirect.rawValue)]
        scrollView.bounces = true
        
        view.addSubview(scrollView)
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalToConstant: 1150).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
    }
    
    private func setUpContentView() {
        contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        contentView.pinEdgesToSuperviewEdges()
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
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
