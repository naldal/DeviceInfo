// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iOSDeviceInfo",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "iOSDeviceInfo",
            targets: ["iOSDeviceInfo"]),
    ],
    targets: [
        .target(
            name: "iOSDeviceInfo"
        ),
        .testTarget(
            name: "iOSDeviceInfoTests",
            dependencies: ["iOSDeviceInfo"]),
    ]
)
