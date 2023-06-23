// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "PRManager",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(name: "PRManager", targets: ["PRManager"])
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "PRManager",
            dependencies: []
        )
    ]
)