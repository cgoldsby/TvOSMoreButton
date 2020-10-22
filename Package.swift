// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TvOSMoreButton",
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
        .package(name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing.git", from: "1.8.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TvOSMoreButton",
            dependencies: [
            ],
            path: "Source",
            exclude: ["Artwork", "Example", "Info.plist"],
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
        ),
    ]
)
