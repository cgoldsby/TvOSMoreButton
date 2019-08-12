//
//  Tests_TvOSMoreButton.swift
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

import SnapshotTesting
import XCTest
@testable import TvOSMoreButton

// swiftlint:disable type_name
final class Tests_TvOSMoreButton: XCTestCase {
// swiftlint:enable type_name

    private var sut: TvOSMoreButton!

    override func setUp() {
        super.setUp()
        localizedStringBundle = .testBundle()
        let frame = CGRect(x: 0, y: 0, width: 500, height: 100)
        sut = TvOSMoreButton(frame: frame)
//        record = true
    }

    override func tearDown() {
        super.tearDown()
        localizedStringBundle = .main
    }

    func test_that_button_with_text_that_fits_and_focused_mode_auto_can_not_become_focused() {
        // Given
        precondition(sut.focusableMode == .auto)

        // When
        sut.text = textThatFits

        // Then
        XCTAssertFalse(sut.canBecomeFocused)
    }

    func test_that_button_with_truncated_text_and_focused_mode_auto_can_become_focused() {
        // Given
        precondition(sut.focusableMode == .auto)

        // When
        sut.text = longText

        // Then
        XCTAssertTrue(sut.canBecomeFocused)
    }

    func test_that_button_with_text_that_fits_and_focused_mode_manual_can_become_focused() {
        // When
        sut.text = textThatFits
        sut.focusableMode = .manual(true)

        // Then
        XCTAssertTrue(sut.canBecomeFocused)
    }

    func test_that_button_with_truncated_text_and_focused_mode_manual_can_not_become_focused() {
        // When
        sut.text = longText
        sut.focusableMode = .manual(false)

        // Then
        XCTAssertFalse(sut.canBecomeFocused)
    }

    func test_that_button_with_truncated_text_can_be_come_focused_when_chaning_focus_mode_to_auto() {
        // Given
        sut.focusableMode = .manual(false)
        precondition(!sut.canBecomeFocused)

        // When
        sut.text = longText
        sut.focusableMode = .auto

        // Then
        XCTAssertTrue(sut.canBecomeFocused)
    }

    // MARK: - Snapshots

    func test_that_unfocused_button_with_text_that_fits_renders_correctly() {
        // When
        sut.text = textThatFits

        // Then
        📸(sut)
    }

    func test_that_unfocused_button_with_truncated_text_renders_correctly() {
        // When
        sut.text = longText

        // Then
        📸(sut)
    }

    func test_that_unfocused_button_with_text_that_fits_and_custom_text_color_renders_correctly() {
        // Given
        let customTextColor = UIColor.yellow

        // When
        sut.text = textThatFits
        sut.textColor = customTextColor

        // Then
        📸(sut)
    }

    func test_that_unfocused_button_with_truncated_text_and_and_custom_text_color_renders_correctly() {
        // Given
        let customTextColor = UIColor.yellow

        // When
        sut.text = longText
        sut.textColor = customTextColor

        // Then
        📸(sut)
    }

    func test_that_unfocused_button_with_text_that_fits_and_custom_font_renders_correctly() {
        // Given
        let textThatFits = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eius."
        let currentFont = sut.font
        let customFont = UIFont(name: "AmericanTypewriter", size: currentFont.pointSize)!

        // When
        sut.text = textThatFits
        sut.font = customFont

        // Then
        📸(sut)
    }

    func test_that_unfocused_button_with_truncated_text_and_custom_font_renders_correctly() {
        // Given
        let currentFont = sut.font
        let customFont = UIFont(name: "AmericanTypewriter", size: currentFont.pointSize)!

        // When
        sut.text = longText
        sut.font = customFont

        // Then
        📸(sut)
    }

    func test_that_unfocused_button_with_truncated_text_and_custom_trailing_text_font_renders_correctly() {
        // Given
        let currentFont = sut.trailingTextFont
        let customFont = UIFont(name: "AmericanTypewriter-Bold", size: currentFont.pointSize)!

        // When
        sut.text = longText
        sut.trailingTextFont = customFont

        // Then
        📸(sut)
    }

    func test_that_unfocused_button_with_truncated_text_and_custom_trailing_text_color_renders_correctly() {
        // Given
        let customTrailingTextColor = UIColor.yellow

        // When
        sut.text = longText
        sut.trailingTextColor = customTrailingTextColor

        // Then
        📸(sut)
    }

    func test_that_unfocused_button_with_truncated_text_and_custom_trailing_text_renders_correctly() {
        // Given
        let customTrailingText = "🚜"

        // When
        sut.text = longText
        sut.trailingText = customTrailingText

        // Then
        📸(sut)
    }

    func test_that_unfocused_button_with_truncated_text_and_custom_ellipses_string_renders_correctly() {
        // Given
        let customEllipsesString = " → "

        // When
        sut.text = longText
        sut.ellipsesString = customEllipsesString

        // Then
        📸(sut)
    }

    func test_that_unfocused_button_with_text_that_fits_and_custom_text_alignment_renders_correctly() {
        // Given
        let customTextAlignment = NSTextAlignment.right

        // When
        sut.text = textThatFits
        sut.textAlignment = customTextAlignment

        // Then
        📸(sut)
    }

    func test_that_unfocused_button_with_truncated_text_and_custom_text_alignment_renders_correctly() {
        // Given
        let customTextAlignment = NSTextAlignment.right

        // When
        sut.text = longText
        sut.textAlignment = customTextAlignment

        // Then
        📸(sut)
    }

    func test_that_focused_button_with_truncated_text_renders_correctly() {
        // When
        sut.text = longText
        sut.applyFocusedAppearance()

        // Then
        📸(sut)
    }

    func test_that_button_with_truncated_text_has_unfocused_appearance_after_being_focused() {
        // Given
        sut.text = longText
        sut.applyFocusedAppearance()

        // When
        sut.applyUnfocusedAppearance()

        // Then
        📸(sut)
    }

    func test_that_unfocused_button_with_text_that_fits_and_custom_content_inset_renders_correctly() {
        // Given
        let customContentInset = UIEdgeInsets(top: 20, left: 35, bottom: 20, right: 35)
        let textThatFits = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do."

        // When
        sut.text = textThatFits
        sut.contentInset = customContentInset

        // Then
        📸(sut)
    }

    func test_that_unfocused_button_with_truncated_text_and_custom_content_inset_renders_correctly() {
        // Given
        let customContentInset = UIEdgeInsets(top: 20, left: 35, bottom: 20, right: 35)

        // When
        sut.text = longText
        sut.contentInset = customContentInset

        // Then
        📸(sut)
    }

    // MARK: - Private

    // swiftlint:disable identifier_name
    private func 📸(_ view: UIView, file: StaticString = #file, testName: String = #function, line: UInt = #line) {
        // swiftlint:enable identifier_name

        var frame = sut.bounds
        frame.size.width += 30
        frame.size.height += 30

        let containerView = UIView(frame: frame)
        containerView.backgroundColor = .darkGray
        containerView.addSubview(view)
        sut.center = containerView.center

        assertSnapshot(
            matching: containerView,
            as: .image,
            file: file,
            testName: testName,
            line: line
        )
    }
}

extension Bundle {
    static func testBundle() -> Bundle! {
        return Bundle(identifier: "com.cgoldsby.TvOSMoreButton.UnitTests")!
    }
}

let longText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"
let textThatFits = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor inc."
