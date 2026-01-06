// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TvOSMoreButton",
    defaultLocalization: "en",
    platforms: [
        .tvOS(.v10)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TvOSMoreButton",
            targets: ["TvOSMoreButton"])
    ],
    dependencies: [
        .package(name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.8.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TvOSMoreButton",
            dependencies: [
            ],
            path: ".",
            exclude: ["Artwork", "Example", "Tests", "Source/Info.plist", "TvOSMoreButton.xcodeproj", "TvOSMoreButton.xcworkspace", "Podfile", "Podfile.lock", "TvOSMoreButton.podspec", "Gemfile", "Gemfile.lock", "CHANGELOG.md", "README.md", "LICENSE", ".github", ".swiftlint.yml", ".xcode-version", ".gitignore"],
            sources: ["Source"],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "TvOSMoreButtonTests",
            dependencies: ["TvOSMoreButton", "SnapshotTesting"],
            path: "Tests",
            exclude: ["Info.plist"],
            resources: [
                .process("Public/Views/__Snapshots__/Tests_TvOSMoreButton"),
                .process("Resources/Localizable.strings")
            ]
        )
    ]
)
