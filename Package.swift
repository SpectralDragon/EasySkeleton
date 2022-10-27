// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EasySkeleton",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14),
        .macOS(.v11)
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
