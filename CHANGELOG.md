# Change Log
All notable changes to this project will be documented in this file.
`TvOSMoreButton` adheres to [Semantic Versioning](http://semver.org/).

#### 1.x Releases
- `1.1.x` Releases - [1.1.0](#110) | [1.1.1](#111) | [1.1.2](#112)
- `1.0.x` Releases - [1.0.0](#100) | [1.0.1](#101) | [1.0.2](#102)

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
