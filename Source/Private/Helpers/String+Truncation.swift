//
//  String+Truncation.swift
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

import Foundation
import CoreGraphics
import UIKit

extension String {

    func truncateToSize(size: CGSize,
                        ellipsesString: String,
                        trailingText: String,
                        attributes: [NSAttributedString.Key: Any],
                        trailingTextAttributes: [NSAttributedString.Key: Any]) -> NSAttributedString {

        if !willFit(to: size,
                    attributes: attributes,
                    trailingTextAttributes: trailingTextAttributes) {

            let indexOfLastCharacterThatFits = indexThatFits(size: size,
                                                             ellipsesString: ellipsesString,
                                                             trailingText: trailingText,
                                                             attributes: attributes,
                                                             trailingTextAttributes: trailingTextAttributes,
                                                             minIndex: 0,
                                                             maxIndex: count)

            let range = startIndex..<index(startIndex, offsetBy: indexOfLastCharacterThatFits)
            let substring = self[range]
            let attributedString = NSMutableAttributedString(string: substring + ellipsesString, attributes: attributes)
            let attributedTrailingString = NSAttributedString(string: trailingText, attributes: trailingTextAttributes)
            attributedString.append(attributedTrailingString)
            return attributedString

        }
        else {
            return NSAttributedString(string: self, attributes: attributes)
        }
    }

    func willFit(to size: CGSize,
                 ellipsesString: String = "",
                 trailingText: String = "",
                 attributes: [NSAttributedString.Key: Any],
                 trailingTextAttributes: [NSAttributedString.Key: Any]) -> Bool {

        var trailingTextAttributes = trailingTextAttributes
        if let textFont = attributes[.font] as? UIFont,
           let trailingTextFont = trailingTextAttributes[.font] as? UIFont,
           trailingTextFont.lineHeight < textFont.lineHeight {
            trailingTextAttributes[.font] = textFont
        }

        let attributedString = NSMutableAttributedString(string: self + ellipsesString, attributes: attributes)
        let attributedTrailingString = NSAttributedString(string: trailingText, attributes: trailingTextAttributes)
        attributedString.append(attributedTrailingString)

        let boundedSize = CGSize(width: size.width, height: .greatestFiniteMagnitude)
        let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]
        let boundedRect = attributedString.boundingRect(with: boundedSize,
                                                        options: options,
                                                        context: nil)
        return boundedRect.height <= size.height
    }

    // MARK: - Private

    private func indexThatFits(size: CGSize,
                               ellipsesString: String,
                               trailingText: String,
                               attributes: [NSAttributedString.Key: Any],
                               trailingTextAttributes: [NSAttributedString.Key: Any],
                               minIndex: Int,
                               maxIndex: Int) -> Int {

        guard maxIndex - minIndex != 1 else { return minIndex }

        let midIndex = (minIndex + maxIndex) / 2
        let range = startIndex..<index(startIndex, offsetBy: midIndex)
        let substring = String(self[range])

        if !substring.willFit(to: size,
                              ellipsesString: ellipsesString,
                              trailingText: trailingText,
                              attributes: attributes,
                              trailingTextAttributes: trailingTextAttributes) {

            return indexThatFits(size: size,
                                 ellipsesString: ellipsesString,
                                 trailingText: trailingText,
                                 attributes: attributes,
                                 trailingTextAttributes: trailingTextAttributes,
                                 minIndex: minIndex,
                                 maxIndex: midIndex)
        }
        else {
            return indexThatFits(size: size,
                                 ellipsesString: ellipsesString,
                                 trailingText: trailingText,
                                 attributes: attributes,
                                 trailingTextAttributes: trailingTextAttributes,
                                 minIndex: midIndex,
                                 maxIndex: maxIndex)

        }
    }
}
