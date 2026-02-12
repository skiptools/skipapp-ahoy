// swift-tools-version: 6.1
// This is a Skip (https://skip.dev) package.
import PackageDescription

let package = Package(
    name: "skipapp-ahoy",
    defaultLocalization: "en",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(name: "AhoySkipper", type: .dynamic, targets: ["AhoySkipper"]),
        .library(name: "SkipperModel", type: .dynamic, targets: ["SkipperModel"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "1.7.2"),
        .package(url: "https://source.skip.tools/skip-fuse-ui.git", from: "1.0.0"),
        .package(url: "https://source.skip.tools/skip-fuse.git", from: "1.0.0"),
        .package(url: "https://source.skip.tools/skip-model.git", from: "1.0.0")
    ],
    targets: [
        .target(name: "AhoySkipper", dependencies: [
            "SkipperModel",
            .product(name: "SkipFuseUI", package: "skip-fuse-ui")
        ], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .target(name: "SkipperModel", dependencies: [
            .product(name: "SkipFuse", package: "skip-fuse"),
            .product(name: "SkipModel", package: "skip-model")
        ], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "SkipperModelTests", dependencies: [
            "SkipperModel",
            .product(name: "SkipTest", package: "skip")
        ], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)
