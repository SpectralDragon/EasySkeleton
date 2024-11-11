// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EasySkeleton",
    platforms: [
        .iOS(.v16),
        .tvOS(.v16),
        .macOS(.v13),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "EasySkeleton",
            targets: ["EasySkeleton"]
        )
    ],
    targets: [
        .target(
            name: "EasySkeleton",
            dependencies: []
        ),
        
        .testTarget(
            name: "EasySkeletonTests",
            dependencies: ["EasySkeleton"]
        ),
    ]
)
