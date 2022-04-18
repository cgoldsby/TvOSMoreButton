# Change Log
All notable changes to this project will be documented in this file.
`TvOSMoreButton` adheres to [Semantic Versioning](http://semver.org/).

#### 1.x Releases
- `1.4.x` Releases - [1.4.0](#140) | [1.4.1](#141)
- `1.3.x` Releases - [1.3.0](#130)
- `1.2.x` Releases - [1.2.0](#120) | [1.2.1](#121) | [1.2.2](#122) | [1.2.3](#123)
- `1.1.x` Releases - [1.1.0](#110) | [1.1.1](#111) | [1.1.2](#112) | [1.1.3](#113)| [1.1.4](#114)
- `1.0.x` Releases - [1.0.0](#100) | [1.0.1](#101) | [1.0.2](#102)

## [1.4.1](https://github.com/cgoldsby/TvOSMoreButton/releases/tag/1.4.1)
Released on 2022-04-18.
### Fix warning when using Xcode 13.2.1 🛠
Fix Xcode warnings when using Xcode 13.2.1 (13C100) (#38) via Chris Goldsby.

Have a happy spring everyone! 🌸

## [1.4.0](https://github.com/cgoldsby/TvOSMoreButton/releases/tag/1.4.0)
Released on 2020-10-22.
### Support Swift Package Manager (SPM) 📦
Support for Swift Package Manager (#35) via Markus Mueller.

Personal thanks to everyone who contributed! 🙇

## [1.3.0](https://github.com/cgoldsby/TvOSMoreButton/releases/tag/1.3.0)
Released on 2020-02-18.
### Update to Swift 5 🦉
Support for building with Xcode 11 and Swift 5.0. This version requires Xcode 11 or later with Swift 5.0 compiler (#33) via David Cordero.

Personal thanks to everyone who contributed! 🙇

## [1.2.3](https://github.com/cgoldsby/TvOSMoreButton/releases/tag/1.2.3)
Released on 2019-01-16.
### More control over when button is focused 🔢
This release adds new functionality, `focusableMode` to define when the button should be focus (#29).

By default the focusable mode is set to `auto`. When the text is too long the button will be focusable, else it will not be focusable. This is the current behavior.

In addition, you can set the focusable mode to `manual(_ isFocusable: Bool)`. This mode will force the button to be always be focused or never be focused.

* Added `focusableMode` property (#29) via Roman Gritsuk

Personal thanks to everyone who contributed! 🙇

Let make 2019 a great year together! 👩‍💻👨‍💻

## [1.2.2](https://github.com/cgoldsby/TvOSMoreButton/releases/tag/1.2.2)
Released on 2018-12-18.
### Incorrect Trailing Text Bug Fix 🐞
This release fixes a bug (#26) where the trailing text was being truncated.

* Fixes a bug where the trailing text is being truncated (#28) via Roman Gritsuk

Personal thanks to everyone who contributed! 🙇

2019 is right around the corner! 😉 🎆

## [1.2.1](https://github.com/cgoldsby/TvOSMoreButton/releases/tag/1.2.1)
Released on 2018-12-06.
### Incorrect Focus Style Bug Fix 🐛
This release fixes a bug (#24) where the button (un)focused style is not correct.

* Fixes a bug where the button (un)focused style is not correct (#25) via Chris Goldsby

No API changes.

Have a great winter everyone! Stay warm! And, if I don't see you, "Have a great New Year!" ⛄️

## [1.2.0](https://github.com/cgoldsby/TvOSMoreButton/releases/tag/1.2.0)
Released on 2018-10-15.
### Swift 4.2 🦉
Support for building with Xcode 10 and Swift 4.2. This version requires Xcode 10 or later with Swift 4.2 compiler.

No API changes.

Have a great week everybody! 🎸

## [1.1.4](https://github.com/cgoldsby/TvOSMoreButton/releases/tag/1.1.4)
Released on 2018-09-26.
Added `textAlignment` property to improve right to left text support, e.g. Arabic language.

* Added `textAlignment` (#18) via Furkan Hatipoglu

Personal thanks to everyone who contributed! 🙇

Almost October; may your Halloween be spooky! 🎃

## [1.1.3](https://github.com/cgoldsby/TvOSMoreButton/releases/tag/1.1.3)
Released on 2018-09-01.
### Bug Fixes 🐛

No API changes.

* Update UI whenever `trailingText` & `ellipsesString` changes via Chris Goldsby

Have a Happy Fall everyone! 🍂

## [1.1.2](https://github.com/cgoldsby/TvOSMoreButton/releases/tag/1.1.2)
Released on 2018-05-26.
### Accessibility Updates ♿️

No API changes.

* Add UIAccessibility (#14) via Chris Goldsby
* Code style updates (#13) via Chris Goldsby

Have a Happy Spring everyone! 🌻

## [1.1.1](https://github.com/cgoldsby/TvOSMoreButton/releases/tag/1.1.1)
Released on 2017-10-26.
### Improved Carthage Documentation, Objective-C Support, & Deprecated Warning Fixes

No API changes.

* Document installation via Carthage (#8) via David Cordero
* Objective-C Support (#9) via André Silva
* Fix "characters was deprecated" warning (#10) via David Cordero

What a great release! Personal thanks to everyone who contributed! 🙇

Have a Happy Fall everyone! 🍂

## [1.1.0](https://github.com/cgoldsby/TvOSMoreButton/releases/tag/1.1.0)
Released on 2017-09-16.
### Swift 4 and Xcode 9

**Xcode 9 and 3.2+ is now required.**

**Changes**

This library has been migrated to Swift 4.

No API changes.

**Swift 3.2 Support**

If your project is using Swift 3.2, you can still use this release by overriding the `SWIFT_VERSION` to be 4.0 in your Podfile.

```ruby
post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == 'TvOSMoreButton'
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.0'
            end
        end
    end
end
```

 Or, you can use the previous release, [1.0.2](https://github.com/cgoldsby/TvOSMoreButton/releases/tag/1.0.2), which does not require the `post_install` hook and will compile just fine with Xcode 9 and Swift 3.2.

🎉

## [1.0.2](https://github.com/cgoldsby/TvOSMoreButton/releases/tag/1.0.2)
Released on 2017-04-23.
### Support More Localizations: 🇲🇽, 🇯🇵, 🇳🇱, 🇳🇴, 🇷🇺

No API changes.

#### Added

The `TvOSMoreButton` is now localized in:

Español Mexicano 🇲🇽   
Japanese 🇯🇵  
Dutch 🇳🇱  
Norwegian 🇳🇴
Russian 🇷🇺

## [1.0.1](https://github.com/cgoldsby/TvOSMoreButton/releases/tag/1.0.1)
Released on 2017-03-25.
### Support More Localizations: 🇩🇪, 🇫🇷, 🇪🇸, 🇮🇹

No API changes.

#### Added

The `TvOSMoreButton` is now localized in:

Español 🇩🇪   
French 🇫🇷  
Deutsch 🇪🇸  
Italian 🇮🇹

## [1.0.0](https://github.com/cgoldsby/TvOSMoreButton/releases/tag/1.0.0)
Released on 2017-03-09.
### Initial Release 🎉
