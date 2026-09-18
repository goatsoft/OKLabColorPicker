// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "OKLabColorPicker",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
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
