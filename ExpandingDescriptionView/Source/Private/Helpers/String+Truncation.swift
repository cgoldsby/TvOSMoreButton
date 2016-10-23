//
//  String+Truncation.swift
//  ExpandingDescriptionView
//
//  Created by Christopher Goldsby on 10/18/16.
//  Copyright © 2016 Christopher Goldsby. All rights reserved.
//

import Foundation


extension String {
    
    func truncateToSize(size size: CGSize,
                             ellipsesString: String,
                             trailingText: String,
                             attributes: [String : AnyObject],
                             trailingTextAttributes: [String : AnyObject]) -> NSAttributedString {
        
        if !willFit(to: size, attributes: attributes) {
            let indexOfLastCharacterThatFits = indexThatFits(size: size,
                                                             ellipsesString: ellipsesString,
                                                             trailingText: trailingText,
                                                             attributes: attributes,
                                                             minIndex: 0,
                                                             maxIndex: characters.count)
            
            let range = startIndex..<startIndex.advancedBy(indexOfLastCharacterThatFits)
            let substring = self[range]
            let attributedString = NSMutableAttributedString(string: substring + ellipsesString, attributes: attributes)
            let attributedTrailingString = NSAttributedString(string: trailingText, attributes: trailingTextAttributes)
            attributedString.appendAttributedString(attributedTrailingString)
            return attributedString
            
        }
        else {
            return NSAttributedString(string: self, attributes: attributes)
        }
    }
    
    func willFit(to size: CGSize,
                    ellipsesString: String = "",
                    trailingText: String = "",
                    attributes: [String : AnyObject]) -> Bool {
        
        let text = (self + ellipsesString + trailingText) as NSString
        let boundedSize = CGSize(width: size.width, height: .max)
        let options: NSStringDrawingOptions = [.UsesLineFragmentOrigin, .UsesFontLeading]
        let boundedRect = text.boundingRectWithSize(boundedSize, options: options, attributes: attributes, context: nil)
        return boundedRect.height <= size.height
    }
    
    // MARK: - Private
    
    private func indexThatFits(size size: CGSize,
                                    ellipsesString: String,
                                    trailingText: String,
                                    attributes: [String : AnyObject],
                                    minIndex: Int,
                                    maxIndex: Int) -> Int {
        
        guard maxIndex - minIndex != 1 else { return minIndex }
        
        let midIndex = (minIndex + maxIndex) / 2
        let range = startIndex..<startIndex.advancedBy(midIndex)
        let substring = self[range]
        
        if !substring.willFit(to: size, ellipsesString: ellipsesString, trailingText: trailingText, attributes: attributes) {
            return indexThatFits(size: size,
                                 ellipsesString: ellipsesString,
                                 trailingText: trailingText,
                                 attributes: attributes,
                                 minIndex: minIndex,
                                 maxIndex: midIndex)
        }
        else {
            return indexThatFits(size: size,
                                 ellipsesString: ellipsesString,
                                 trailingText: trailingText,
                                 attributes: attributes,
                                 minIndex: midIndex,
                                 maxIndex: maxIndex)
            
        }
    }
}
