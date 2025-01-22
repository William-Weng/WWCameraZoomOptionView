// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWCameraZoomOptionView",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "WWCameraZoomOptionView", targets: ["WWCameraZoomOptionView"]),
    ],
    targets: [
        .target(name: "WWCameraZoomOptionView", resources: [.copy("Privacy")]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
