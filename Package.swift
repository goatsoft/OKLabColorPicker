// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OKLabColorPicker",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .tvOS(.v17),
        .watchOS(.v10),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "OKLabColorPicker",
            targets: ["OKLabColorPicker"]
        ),
    ],
    targets: [
        .target(
            name: "OKLabColorPicker",
            dependencies: []
        ),
        .testTarget(
            name: "OKLabColorPickerTests",
            dependencies: ["OKLabColorPicker"]
        ),
    ]
)
